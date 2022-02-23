Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BAF4C14C8
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 14:54:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7350B1AAA;
	Wed, 23 Feb 2022 14:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7350B1AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645624443;
	bh=CLZsWQ+7BFB+rBmAyvPvlz6X0mprcYonjsyzkaBx7bY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=awyu+F3i6GPRxln6HXfopXMJttk1e8zeho62AyqZMHRi+knskA7LcV2E22to2ad0X
	 RrVUuHEWrU5+9coLazb8yMMvDujS/aiwQ9IlTdYcFa1wMyoVKktHAT8GWVh8scnhue
	 n1pKjuCi7MQvwr4YyXXPCrs5Ya87uAUq5BmD5z64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B84F8025D;
	Wed, 23 Feb 2022 14:52:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D7DDF80237; Wed, 23 Feb 2022 14:52:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DDE5F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 14:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DDE5F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HPpqK8wS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645624370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zg8eMdlUSfsC97SBpNr/q2lGhR0GmoyErU4xR7SjinQ=;
 b=HPpqK8wSBQSP7A/uuuNqtDlLAElmAQjvTrUXHF0uI0QsLvaNmgGTfvQF/LH4anihif9oNP
 9GuGCnqoKyLR5pDFMhu9JObHn0qfbRfxuEF8GH3LvYYkGBAspofcGQ34RaO2XsCA5R8Iwj
 f+5j5h+mFi6uj0YvDktLwbN3FNWXJNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-YhBZL0vRNBaq1VEVbcELsQ-1; Wed, 23 Feb 2022 08:52:49 -0500
X-MC-Unique: YhBZL0vRNBaq1VEVbcELsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0A2E800422;
 Wed, 23 Feb 2022 13:52:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 900CC838C5;
 Wed, 23 Feb 2022 13:52:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID
Date: Wed, 23 Feb 2022 14:52:37 +0100
Message-Id: <20220223135237.731638-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The Lenovo Yoga Tablet 2 1050F/L tablets use an ACPI HID of "10WM5102"
for their wm5102 codec, add this to the list of HIDs for the wm5102 codec.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/common/soc-acpi-intel-byt-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index 142000991813..c532529a3856 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -127,7 +127,7 @@ static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
 
 static const struct snd_soc_acpi_codecs wm5102_comp_ids = {
 	.num_codecs = 2,
-	.codecs = { "WM510204", "WM510205"},
+	.codecs = { "10WM5102", "WM510204", "WM510205"},
 };
 
 static const struct snd_soc_acpi_codecs da7213_comp_ids = {
-- 
2.35.1

