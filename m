Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4D7756CC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 12:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7C7D8;
	Wed,  9 Aug 2023 12:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7C7D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691575579;
	bh=sf9Kz0iML+2f+R3Sy8oBy5DEvll9LGSMq1a/6RRD+Io=;
	h=From:To:Cc:Subject:Date:References:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k99jz/rHhkHFRN+9F5wMleosh2eQ5TOM5GO6PDTzdd7CFEkobA709SoGY4IK/gTDj
	 DE4ggr+S9hOUVyXDwMmITTWeD2sXgAKESSJ1PW2MgrIvcLRGrbFw3vn1ktcn79yYNz
	 Z1f0zPZvGbco6pUS3oF08x0wR6TY2JHK29uR2Vu8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3263F80508; Wed,  9 Aug 2023 12:05:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FC2BF80116;
	Wed,  9 Aug 2023 12:05:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A95F80134; Wed,  9 Aug 2023 12:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A498F800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 12:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A498F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=KB5H+3oi
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230809100454euoutp01caf16e73ceecbf1e1442956fcd283834~5rvMuK7mh0951709517euoutp01J
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 10:04:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230809100454euoutp01caf16e73ceecbf1e1442956fcd283834~5rvMuK7mh0951709517euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1691575494;
	bh=/5ut5gFTa7/p5XT7l1i9t7/sbaWqTjpKuUqDjthrNEM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KB5H+3oiD+hkDk3fuYqGt4XkvoeZKI/jrSW3LFT+wsJVq7zKWK4kivDtPzY8AGi8u
	 KmMX1lJrcmYNvHbi6Ip+3/XDV4DjEbWot2mzJ1QXwRzN58FpS8SndiqhLECKPkja76
	 xVtrMqWJ76h/IE4a8xr/aH8MFQJ8dBmd5gcDrnVs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230809100454eucas1p1e247fb3d1f6ec80ee2918e46b4184229~5rvMQvSaA0982909829eucas1p1X;
	Wed,  9 Aug 2023 10:04:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 08.EA.37758.5C463D46; Wed,  9
	Aug 2023 11:04:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230809100453eucas1p26811129b083949247b32369f9c38b89a~5rvL7jnkf0078400784eucas1p2h;
	Wed,  9 Aug 2023 10:04:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230809100453eusmtrp25fbe8d3706ba9bd65945bd43517deb1a~5rvL6nMev1897718977eusmtrp2B;
	Wed,  9 Aug 2023 10:04:53 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-7c-64d364c5d4c1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.24.14344.5C463D46; Wed,  9
	Aug 2023 11:04:53 +0100 (BST)
Received: from AMDC4653.eu.corp.samsungelectronics.net (unknown
	[106.120.51.32]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230809100453eusmtip255dc261cf8af61371862c6ddb4553c9f~5rvLbKQPx2919029190eusmtip2N;
	Wed,  9 Aug 2023 10:04:53 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: alsa-devel@alsa-project.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH] ASoC: samsung: midas_wm1811: Fix 'Headphone Switch' control
 creation
Date: Wed,  9 Aug 2023 12:04:46 +0200
Message-Id: <20230809100446.2105825-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djPc7pHUy6nGExfYWOx+ulrNosrFw8x
	WUx9+ITN4tuVDiaLtUfuslt07upntTj8pp3VYsP3tYwOHB4bPjexeeycdZfdY9OqTjaPfW+X
	sXn0bVnF6LF+y1WWALYoLpuU1JzMstQifbsEroz2M2vZC75zVEw71MjWwHiZvYuRk0NCwERi
	28lW1i5GLg4hgRWMEidbP7FBOF8YJXY+Wc0E4XxmlOhethSu5dj3aVAtyxklGjb2sIAkhARa
	mSRWLfcFsdkEDCW63nYBjeLgEBGQlzj0Pg+knllgGpNE6+zrzCBxYYFwieWLREDKWQRUJbbN
	Oc4MYvMK2Eu8uPqCFWKXvMT+g2eh4oISJ2c+AVvFDBRv3jqbGWSmhMBaDomFZ9cwQTS4SHzp
	P80CYQtLvDq+BepoGYn/O+czQTS0M0os+H0fypkA9MHzW4wQVdYSd879AruaWUBTYv0ufYiw
	o0Trmu2sIGEJAT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQMYXtIHF24CWyK
	kECsxNqbORMYFWYh+WwWks9mIZywgJF5FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmD6
	Of3v+NcdjCtefdQ7xMjEwXiIUYKDWUmE1zb4UooQb0piZVVqUX58UWlOavEhRmkOFiVxXm3b
	k8lCAumJJanZqakFqUUwWSYOTqkGpoRfex+V6DtkLjnW4OZW+q3JYfXOHXc99N5/SbHcf/li
	68eE26l3bfQSthfsTtatad7/6qXoSZOOi17HE/mim5dejt5/r8ZJJqXOa7r0KwbVMO2sBT1C
	H3h+qWx0WrH+8CKPXU+sJrR7lM/SkeSQqW7gPX/Xcc3P3ij5ot4uZ9mXD/f53pT45Zhe3dGi
	rzFPcXJt29l7BdVXFKzcLhw+GJu1uC537ySzZW4S/9prKqaxblF9K74mevE9fh+v/8LBd3UW
	XG39evTqW3b1epGp50ub0xNTt62JUP3DdcfWMEiwf/u21v0KfSzLyyU+/YiZkfn7+ZvYL//+
	8Bh//PlEoPf+4fk13D7sfwt3PD1bo8RSnJFoqMVcVJwIADnWRquuAwAA
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsVy+t/xe7pHUy6nGJz/oGqx+ulrNosrFw8x
	WUx9+ITN4tuVDiaLtUfuslt07upntTj8pp3VYsP3tYwOHB4bPjexeeycdZfdY9OqTjaPfW+X
	sXn0bVnF6LF+y1WWALYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU
	1JzMstQifbsEvYz2M2vZC75zVEw71MjWwHiZvYuRk0NCwETi2PdprF2MXBxCAksZJZpO7GWE
	SMhInJzWwAphC0v8udbFBlHUzCTxe9k8sCI2AUOJrrcgCQ4OEQF5iUPv80BqmAXmMEk8ePyY
	DaRGWCBUomlHD5jNIqAqsW3OcWYQm1fAXuLF1RdQC+Ql9h88CxUXlDg58wkLiM0MFG/eOpt5
	AiPfLCSpWUhSCxiZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgSG/rZjP7fsYFz56qPeIUYm
	DsZDjBIczEoivLbBl1KEeFMSK6tSi/Lji0pzUosPMZoC3TeRWUo0OR8YfXkl8YZmBqaGJmaW
	BqaWZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUzpp245XjY8uGydeantnJjls11WM/15
	YtbQksH62WJ9Wl/mlPnTTt49VV7Hc/tEslu4ryyzjpWt5PzjW1LZO7Jnfz3D6GKbueNZ+jS9
	WZ3RnyNS7/GcmvAhx++EhP6E6wfkKuXmZGa0rL5r8DXn1+o36998WnaZb0H1JrnXc/uuLlPY
	6fZ+3/SD+3dsTdosPbVPYt7fpf8qC5N9zgkL/H2XU1HwOZtR4PKWJQ1NWjUxIroqGocMDm3J
	330mYodxo+fWTRGFG7bp7JGwV8/eGSAXIts/TzvXkf/RVbv07IUNFbM7ftyyVYrYGLSaM1je
	YcHaTJt3i7IzJIqKpWYsPDGbibXmwNWXqx84rclM/OymxFKckWioxVxUnAgAHJRruQYDAAA=
X-CMS-MailID: 20230809100453eucas1p26811129b083949247b32369f9c38b89a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230809100453eucas1p26811129b083949247b32369f9c38b89a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230809100453eucas1p26811129b083949247b32369f9c38b89a
References: 
 <CGME20230809100453eucas1p26811129b083949247b32369f9c38b89a@eucas1p2.samsung.com>
Message-ID-Hash: BUB4JBDFT73F7IX5VT5SRYZ2WUVJBTX7
X-Message-ID-Hash: BUB4JBDFT73F7IX5VT5SRYZ2WUVJBTX7
X-MailFrom: m.szyprowski@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUB4JBDFT73F7IX5VT5SRYZ2WUVJBTX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'Headphone Switch' control is already registered from
sound/soc/codecs/wm_hubs.c:479, so duplicating it in midas_wm1811
causes following probe failure:

midas-audio sound: control 2:0:0:Headphone Switch:0 is already present
midas-audio sound: ASoC: Failed to add Headphone Switch: -16
midas-audio sound: Failed to register card: -16
midas-audio: probe of sound failed with error -16

Fix this by dropping duplicated control.

Fixes: d27224a45e54 ("ASoC: samsung: midas_wm1811: Map missing jack kcontrols")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/midas_wm1811.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 44b32f5cddca..126098fdcf1b 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -257,7 +257,6 @@ static const struct snd_kcontrol_new midas_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Main Mic"),
 	SOC_DAPM_PIN_SWITCH("Sub Mic"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Headphone"),
 
 	SOC_DAPM_PIN_SWITCH("FM In"),
 };
-- 
2.34.1

