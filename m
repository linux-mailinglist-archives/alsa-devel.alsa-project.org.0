Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAD32A202
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E222C1730;
	Tue,  2 Mar 2021 15:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E222C1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614694519;
	bh=6YeEQeSY2aAqu4UwA7UJx6z2RKa4wMiORHUtgH+Rzvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5Ic/x85jMzeGvO4D9JxSUo036OT6ducyXMiFy1d+aHg/7m00qp2iSJszmUPpx9vZ
	 7f0u71UYTnR30jBbPnU56rX0UV+I/SjNXY95nG19w5Y90OglGCshuYCAd265xkFxpr
	 IO5K7sXFHeEZ7C3UrlLoKikmB/j6UMPPsGoci5pM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 877E4F802E2;
	Tue,  2 Mar 2021 15:14:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB195F80269; Tue,  2 Mar 2021 15:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D46CF80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D46CF80088
Received: from [100.112.135.57] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.us-west-2.aws.symcld.net id A8/2C-22828-1574E306;
 Tue, 02 Mar 2021 14:10:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsWSLveKXdfP3S7
 BoGGlhcWVi4eYLNb1pzsweWz43MTmsal1CWsAUxRrZl5SfkUCa8aqT7eYCtZyVvyZuIKlgfE3
 excjF4eQwH9GicMPzzBDOK8ZJd5uf8vYxcjJwSagLbFlyy+2LkYODhEBGYkPaz1BwswCoRL3L
 qxjA7GFBUwlJn/vZwWxWQRUJB5P2MwCYvMKWEl8mrQZbIyEgLzE/9ZTYDWcAqoSZ7oeg9UIAd
 Xff7CEDaJeUOLkzCcsEPPlJZq3zmaGsCUkDr54wQwxR0Fi/5+zrBB2gkTPv0dsExgFZiFpn4W
 kfRaS9gWMzKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNjU2AbEu9xCrdJL3SYt3y1OISXSO9xPJi
 veLK3OScFL281JJNjMCATiloy93BuPHNB71DjJIcTEqivLsE7BKE+JLyUyozEosz4otKc1KLD
 zHKcHAoSfDecgXKCRalpqdWpGXmAKMLJi3BwaMkwjvHCSjNW1yQmFucmQ6ROsWoKCXO6+UGlB
 AASWSU5sG1wSL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXneQKTyZeSVw018BLWYCWrw
 90ApkcUkiQkqqgWmSxOpjHwWd4ibvWnRq05qj770cIy2dgr5vum4aN+1s7g/NHdxuhxy9zeQN
 ReICfOsOtt886JlsKvaQ//crFfsNzjVMJ8/tVzMJejVHVP2oU9wF2UftXNdL2rfNPbjr+au0u
 7XpHy5GHKhj22cudulnnmDTTL95umGyR+RetaxUMQvc9VdignhQzeLLV+NYW2aXaBYcne7Xc/
 vOxEdVQedSFtV4pxXWBrzMvyy0j9M7dO/JXke1FXskrmUHCL3JLC997OmszflMwVrpx8ZdZ58
 /XnC7KkRFrdRJlotRYdblc9pXrH8fuvjfeRv/2wwtg3W2R+epTK9fp3+a61x0fMsblrniDbdF
 q+8cfXm3rUGJpTgj0VCLuag4EQAleH2AYwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-36.tower-355.messagelabs.com!1614694220!67213!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19625 invoked from network); 2 Mar 2021 14:10:22 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
 by server-36.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Mar 2021 14:10:22 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id A0320DC26ECAE212DB6E;
 Tue,  2 Mar 2021 22:10:19 +0800 (CST)
Received: from localhost.localdomain.com (10.64.94.117) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 2 Mar 2021 09:09:16 -0500
From: Mark Pearson <markpearson@lenovo.com>
To: <markpearson@lenovo.com>
Subject: [PATCH] ALSA: hda: ignore invalid NHLT table
Date: Tue, 2 Mar 2021 09:10:03 -0500
Message-ID: <20210302141003.7342-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.94.117]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-Mailman-Approved-At: Tue, 02 Mar 2021 15:14:04 +0100
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

