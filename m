Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAC3765D4
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 15:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1521689;
	Fri,  7 May 2021 15:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1521689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620393225;
	bh=yS6ShIyAl4d3OZN+TWluMaunZma6496rooLDVVh06oE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCWcOVomiybe5XKzlHjvVbbXEoNfnvsCG9GCEuBnTobYpX5svCBhIsIeFaBtcEJSX
	 mftHs/bWwtD6N2POLUD1ni2zpf4DMi2tDZQHTLfOhNlTG8XumELk6s1Z7rgnpDd1rd
	 63wEVLLwDy63Btbkt8lOHYTUh0XA4+pHiurc+b3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6497F80424;
	Fri,  7 May 2021 15:11:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02478F8026D; Fri,  7 May 2021 15:11:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E9E8F80105
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 15:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E9E8F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GjtWQM6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620393106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqH4/HZfktHT8cWUo/pYueVMCLTRsRLj4KNf+gBNUj4=;
 b=GjtWQM6XQEDFjf6cCYy+YrpP8BLk8OYmXVm03HoEhWV0qZ9qiENMP6NbWaIhtejAKv5Yj+
 UtUIGEwuek/tzau5wxQcHMa4gBaY4QVlN+a3/vHslF4IRYQXCOdwSAlAyzS+Ldw8y+hWLv
 0cS50F2M+fqe2qxN0T3gN4XrzNFQ1mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-kS-aZcIrOBW7VuWbRFl_cw-1; Fri, 07 May 2021 09:11:44 -0400
X-MC-Unique: kS-aZcIrOBW7VuWbRFl_cw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F31A80059E;
 Fri,  7 May 2021 13:11:43 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D4C5C5DF;
 Fri,  7 May 2021 13:11:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 1/3] cht-bsw-rt5672: Add support for the
 components string
Date: Fri,  7 May 2021 15:11:37 +0200
Message-Id: <20210507131139.10231-2-hdegoede@redhat.com>
In-Reply-To: <20210507131139.10231-1-hdegoede@redhat.com>
References: <20210507131139.10231-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Upcoming kernel versions will report which speaker and dmic config is used
by the device in a components strings so that we don't need to duplicate
the DMI quirks in both the kernel and the UCM profile.

Add support for getting the speaker and dmic config from the components string.

Note the old DMI matching is kept for support of older kernels, this means
that on devices where the old DMI matching was used things like:

Define.MonoSpeaker ""

Will now be done twice, this is harmless as long as the kernel and UCM profile
DMI quirks are in sync, which they are.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/cht-bsw-rt5672/HiFi.conf | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/ucm2/cht-bsw-rt5672/HiFi.conf b/ucm2/cht-bsw-rt5672/HiFi.conf
index 5e5f78f..41828ef 100644
--- a/ucm2/cht-bsw-rt5672/HiFi.conf
+++ b/ucm2/cht-bsw-rt5672/HiFi.conf
@@ -7,7 +7,40 @@ Define.DigitalMic1 "yes"
 Define.DigitalMic2 "yes"
 Define.HeadsetMic "yes"
 
-If.cfg-dmic1 {
+# Figure out which components are in use on the device, we check both the
+# components string (present on newer kernels) as well as checking for DMI
+# strings for compatibility with older kernels. Note DMI matches for new
+# models should only be added to the kernel, this UCM profile will then
+# automatically pick up the info from the components string.
+
+If.components-stereo-spk {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-spk:2"
+	}
+	True.Define.MonoSpeaker ""
+}
+
+If.components-dmic1 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-mic:dmic1"
+	}
+	True.Define.DigitalMic2 ""
+}
+
+If.components-dmic2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-mic:dmic2"
+	}
+	True.Define.DigitalMic1 ""
+}
+
+If.dmi-dmic1 {
 	Condition {
 		Type RegexMatch
 		String "${CardLongName}"
@@ -19,7 +52,7 @@ If.cfg-dmic1 {
 	}
 }
 
-If.cfg-dmic2 {
+If.dmi-dmic2 {
 	Condition {
 		Type RegexMatch
 		String "${CardLongName}"
-- 
2.31.1

