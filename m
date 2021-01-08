Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA92EF150
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 12:34:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBAE16E0;
	Fri,  8 Jan 2021 12:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBAE16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610105657;
	bh=xSSG0izA+R/8Fk0ija43sIWnpqOouHh5gYiLIE+n9eU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/uMWlPCAdvGy+488brfdIPJHWZyJIkujkeCT1VCdxJciEUoU0o6KsAa0bek5VeRT
	 kiiIO4cwq3cGFf6lQ9rzmQn/a/qha1+sz2nffVzVAhtCpXf70hbPLOovesDtErnzV+
	 s0Aackcxo3IusfId5pzXUe/ssxjKAj9uXQJjnhFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 068DBF80165;
	Fri,  8 Jan 2021 12:32:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48290F80279; Fri,  8 Jan 2021 12:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A226F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 12:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A226F800E9
IronPort-SDR: bLOFrfrL8C6eqhg1VDkFoeYFsAGV0/Z+aKzurlkhj7lrnCNwYKge+axZ8fCHFqRFiqMdNyKOIZ
 +y2z32nII8RA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="175002628"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="175002628"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 03:32:20 -0800
IronPort-SDR: kOwa0FCjZRcIA9pyH2YipBXdhI4rV2VWwJkogjgaqP5kfTB+x3qZdJHa2II8GqZDfBU0y0BGRO
 tk4qSd730vsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="362310508"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga002.jf.intel.com with ESMTP; 08 Jan 2021 03:32:19 -0800
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/3] ALSA: control: add kcontrol_type to control
Date: Fri,  8 Jan 2021 13:23:53 +0200
Message-Id: <20210108112355.2053917-2-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
References: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Current kcontrol structs don't have a member to describe the control
type. The type is present in the widget which contains the control. As
there can be many controls in one widget it is inherently presumed that
the control types are the same.

Lately there has been use cases where different types of controls would
be needed for single widget. Thus enable this by adding the control type
to kcontrol and kcontrol_new structs.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
---
 include/sound/control.h | 2 ++
 sound/core/control.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/control.h b/include/sound/control.h
index 77d9fa10812d..3933823a606d 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -46,6 +46,7 @@ struct snd_kcontrol_new {
 	unsigned int index;		/* index of item */
 	unsigned int access;		/* access rights */
 	unsigned int count;		/* count of same elements */
+	unsigned int kcontrol_type;
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
 	snd_kcontrol_put_t *put;
@@ -65,6 +66,7 @@ struct snd_kcontrol {
 	struct list_head list;		/* list of controls */
 	struct snd_ctl_elem_id id;
 	unsigned int count;		/* count of same elements */
+	unsigned int kcontrol_type;
 	snd_kcontrol_info_t *info;
 	snd_kcontrol_get_t *get;
 	snd_kcontrol_put_t *put;
diff --git a/sound/core/control.c b/sound/core/control.c
index 3b44378b9dec..f081ae4f839c 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -268,6 +268,8 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 	}
 	kctl->id.index = ncontrol->index;
 
+	kctl->kcontrol_type = ncontrol->kcontrol_type;
+
 	kctl->info = ncontrol->info;
 	kctl->get = ncontrol->get;
 	kctl->put = ncontrol->put;
-- 
2.24.1

