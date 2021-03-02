Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7532A285
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:44:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB391733;
	Tue,  2 Mar 2021 15:43:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB391733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614696249;
	bh=6YeEQeSY2aAqu4UwA7UJx6z2RKa4wMiORHUtgH+Rzvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FB1oosjD4UJxPuV1JryWlYWSoFZxX5G+meThvLjRzzDuu08qkoc2UeSUtoi+v3MqG
	 /HRZetkKa1rRf7qHU7QgynViOj4/s502LmoVALFYS7S5ZvstNWfyoAoSlJlFpbQk1f
	 1hD/czaxdPv3o7TL2ekJ+jtqnM56JkIqtfyLy5Jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5127AF8012D;
	Tue,  2 Mar 2021 15:42:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25C88F80269; Tue,  2 Mar 2021 15:42:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0BE4F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BE4F80088
Received: from [100.112.130.24] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.us-west-2.aws.symcld.net id 66/53-29685-ECE4E306;
 Tue, 02 Mar 2021 14:42:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsWSLveKXfecn12
 Cwd5jfBZXLh5isljXn+7A5LHhcxObx6bWJawBTFGsmXlJ+RUJrBmrPt1iKljLWfFn4gqWBsbf
 7F2MXBxCAv8ZJY63nGWCcF4zSsw+85W5i5GTg01AW2LLll9sXYwcHCICMhIf1nqChJkFQiXuX
 VjHBmILC5hKTP7ezwpiswioSMx7uJ8JxOYVsJJ43HcUbIyEgLzE/9ZTYDWcAqoSZ7oes4DYQk
 D19x8sYYOoF5Q4OfMJC8R8eYnmrbOZIWwJiYMvXkDNUZDY/+csK4SdINHz7xHbBEaBWUjaZyF
 pn4WkfQEj8ypGi6SizPSMktzEzBxdQwMDXUNDI11DYwNdIyNzvcQq3US90mLd8tTiEl0jvcTy
 Yr3iytzknBS9vNSSTYzAgE4paHq8g3Hnmw96hxglOZiURHkbvOwShPiS8lMqMxKLM+KLSnNSi
 w8xynBwKEnwpvkC5QSLUtNTK9Iyc4DRBZOW4OBREuHl8ARK8xYXJOYWZ6ZDpE4xKkqJ887xAU
 oIgCQySvPg2mARfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8JkCk8mXklcNNfAS1mAlo
 8yw1scUkiQkqqgUnSbxvr6dqT0/mnxMw2vffAWm2PLed57/kWfP4Plm/Znle1qsDtfbaHS81d
 hds7TNZM7VQKfXhaRah0TfTforaoOxsC75y8dse6tGaWf+LrttPPV6SYRfKdixa50XbI9/fed
 MO4n1Ez55w4s+/KZ42SOSUXxRXmivAbT3LyFv0Qtrte4D3bX6s6e0fZ7qKaPebpdgeLa49evF
 5WqpeypMBoVXrP4ehFVp7v5wf7Gxwt7ZgvMY/Xoe60ptt5c8mvT6LWHiuUZE69b9p9MOv5I3Y
 x48vn3eYv5pzn9d+yO7J/xvLZWsf+1/c9mvjpaaPg7hOhS42/PWqX4ig4wRfi9WnXl/SVUtyp
 Kb8+5doY3ldiKc5INNRiLipOBAAK+fgqYwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-326.messagelabs.com!1614696140!1424!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17417 invoked from network); 2 Mar 2021 14:42:22 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
 by server-6.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Mar 2021 14:42:22 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 2A454364C64A0770C201;
 Tue,  2 Mar 2021 22:42:18 +0800 (CST)
Received: from localhost.localdomain.com (10.64.94.117) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 2 Mar 2021 09:41:14 -0500
From: Mark Pearson <markpearson@lenovo.com>
To: <markpearson@lenovo.com>
Subject: [PATCH] ALSA: hda: ignore invalid NHLT table
Date: Tue, 2 Mar 2021 09:41:52 -0500
Message-ID: <20210302144152.7718-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.94.117]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: alsa-devel@alsa-project.org,
 Philipp Leskovitz <philipp.leskovitz@secunet.com>
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

On some Lenovo systems if the microphone is disabled in the BIOS
only the NHLT table header is created, with no data. This means
the endpoints field is not correctly set to zero - leading to an
unintialised variable and hence invalid descriptors are parsed
leading to page faults.

The Lenovo firmware team is addressing this, but adding a check
preventing invalid tables being parsed is worthwhile.

Tested on a Lenovo T14.

Tested-by: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Reported-by: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 sound/hda/intel-nhlt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 059aaf04f..0889f2cc5 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -37,6 +37,11 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 	if (!nhlt)
 		return 0;
 
+	if (nhlt->header.length <= sizeof(struct acpi_table_header)) {
+		dev_warn(dev, "Invalid DMIC description table\n");
+		return 0;
+	}
+
 	epnt = (struct nhlt_endpoint *)nhlt->desc;
 
 	for (j = 0; j < nhlt->endpoint_count; j++) {
-- 
2.29.2

