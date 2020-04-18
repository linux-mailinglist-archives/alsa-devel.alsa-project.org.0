Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F361AE9C0
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 06:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25711669;
	Sat, 18 Apr 2020 06:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25711669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587183354;
	bh=nuEnzb7A89GjLJDD9DLVeGTGFFsAG3wA2nCrBOVVBVw=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aVZv+MxXHxApBrLUCtQVCAnCmeP8uldozeyas95zvDjghNadQe558Qq3TaWjTOk46
	 RcQbc/mxT2II8fP6dmAgRcXLS2Tz8zy5LLs2e3xMoVvLPDphb9eMxxkxVQBQ62Qpyt
	 jcgm+hZCt2/6xOHHkyKcoKQbbx2FIhHA/46cSC8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C515DF80122;
	Sat, 18 Apr 2020 06:14:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA06F8014E; Sat, 18 Apr 2020 06:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA34EF8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 06:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA34EF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="hmNP3oVF"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200418041325epoutp03316d924e4e6867f99a83fec786590aa1~GzrdQ0V7T0071400714epoutp03B
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 04:13:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200418041325epoutp03316d924e4e6867f99a83fec786590aa1~GzrdQ0V7T0071400714epoutp03B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587183205;
 bh=ZUs8vWAg2daxDTXcIm1h0C0JR3x2BkqSitDqRmF5MVY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hmNP3oVFt+30zD8u+Jcqh/T+S2J/46NqL5BHu3lGlZ3v2b3euSkRVMcwdJF7wcvDY
 VZ8YFT902Vf3ibiqC/bjIEJS9eJWHG3wER43pzN29zblzA+nfimGZheuD/9P7k5X3e
 AHn+W0Njf706t9Eh+Y4tQhe3OdSkxhd5WBNK4iCE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200418041324epcas2p2f551b61f50b0e44f16de7e8b85a5cbf4~GzrcU4mFT2976029760epcas2p2G;
 Sat, 18 Apr 2020 04:13:24 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.191]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49401t33l4zMqYkV; Sat, 18 Apr
 2020 04:13:22 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.F0.04598.26E7A9E5; Sat, 18 Apr 2020 13:13:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200418041321epcas2p1ceed010fde93a35e763a9db436e1c63b~GzrZPq6gA2634426344epcas2p1c;
 Sat, 18 Apr 2020 04:13:21 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200418041321epsmtrp270554ac16932b177f478897becd007af~GzrZMTwKf1480314803epsmtrp2E;
 Sat, 18 Apr 2020 04:13:21 +0000 (GMT)
X-AuditID: b6c32a45-ea1ff700000011f6-eb-5e9a7e62e945
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 79.AA.04158.06E7A9E5; Sat, 18 Apr 2020 13:13:20 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200418041320epsmtip1a24dd0814310d3c46ad3035f05b7e6c0~GzrZAaUje2291322913epsmtip1O;
 Sat, 18 Apr 2020 04:13:20 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: dapm: fixup dapm kcontrol widget
Date: Sat, 18 Apr 2020 13:13:20 +0900
Message-ID: <000001d61537$b212f620$1638e260$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYVMZcnJIZfjURQTbeGOgQ7UBwOAQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+9273c10cV1WJ6FcN4KyZttq8xouBC0GWRj1V4V2dZdN2ovd
 KSqWj8Cc9lBU0vkgqUwXpdl6WFQ6zV5UFNqLCiJ7WYqp2YPSNu8i//uc7znf3znn9/uJcWkr
 ES5OtzhYu4UxUcRswcXuFWp56j5XsuJV5wK675EXo6veDBB09cVSAV3wuoygT/d7MHqirxij
 bz46jtFt388guqegEosL0rWNFRK6Dtcrka7d7SR0hz1upGv19AuShDtMsUaW0bN2GWtJs+rT
 LQYttWlbSnyKWqNQypUxdDQlszBmVkslJCbJN6abfBNRskzGlOGTkhiOo1avj7VbMxyszGjl
 HFqKtelNNqXSFsUxZi7DYohKs5rXKRUKldpXudtkPPTJK7I5yazCpoOifFQlKUFBYiDXQunV
 J4SfpeRlBJ1VihI028ejCC69H8X5YAJB5b1DvirxtKPky15ev4bgW7tHyAefEDQ9q5k+iiDl
 MP76Je7nMBJg/MptzF+Ekz0IOi50Cf2JuWQ0NJ19JvKzgFwGzfUfkJ8lZAxMnjpJ8BwKd2oG
 BH7GyQi4NFSH83PL4Oe7JiHfIApGJtyBmjCodRZNjw3kWwLuFHwW8IYEaKkoC5jnwuAtj4jn
 cBgbvkbwhv0Ihu//DiQqEThLpTyvAU/9Xcy/P06ugNYrq/mrWAo9LwJ950Bx9x8RL0uguChg
 pODc3UmMlwEa2gJn6+DxVLmwDC1xzVjSNWNJ14xlXP/bHkMCN5rP2jizgeVUNuXMt25H0581
 csNlVP0g0YtIMaJCJIqDNclSIZPJZZu9CMQ4FSbp2uiTJHomO4e1W1PsGSaW8yK17w3K8fB5
 aVbf17c4UpRqlUajiFHTao2KphZIzgc/3yUlDYyD3cOyNtb+z4eJg8LzEWU0qk883YKP7hkP
 jkgasvyoe9gwSq5cfn1WiCL0yCxD3/aEBodqJLerM/VqZuHuQW3lk+bexUOhVE765Jajec4/
 ZG3jzuqikJIbMYvyaojc+gOfpza/73ejigHHKq82vqV3pO+Xvlq+9eTOxo/erqwB58KOirh8
 1ddUzjCkCVtICTgjo4zE7RzzF/UKSYfCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJTjehblacwcbVVhZXLh5ispj68Amb
 xYxt3SwWjfcmsFmsvrqFyeLblQ4mi6MXFzNZbPi+ltHiSOMUJgdOjw2fm9g8ds66y+6xaVUn
 m0ffllWMHuu3XGUJYI3isklJzcksSy3St0vgyuh9eYi9oFOgomlZD3sD41TeLkYODgkBE4mu
 N7VdjFwcQgK7GSVOTpzK3MXICRSXkPgw/ww7hC0scb/lCCtE0XNGiTWfTzGBJNgEdCW+3LsD
 1iAC1PBl1wmwOLPAOUaJyYtdQWxhAXOJZetugA1iEVCVWDH3OSOIzStgKfFv+VI2CFtQ4uTM
 JywgBzEL6Em0bWSEGCMvsf3tHKh7FCR+Pl3GCrFKT+LDt1UsEDUiErM725gnMArOQjJpFsKk
 WUgmzULSsYCRZRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4mRnC8aGntYDxxIv4QowAH
 oxIPb0ffzDgh1sSy4srcQ4wSHMxKIrwH3YBCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeeXzj0UK
 CaQnlqRmp6YWpBbBZJk4OKUaGE2Peqy66MQTdZHp0oOzHbFNlz/sj6xZ671l24WIUzbhqfUr
 pDdtOShs8t/k1IOJE/qUXhWr71a17/XIyFERtGj33rHhkKaIbnlP5aGLW342nutUFFk6T/bp
 9YX6+2/M0772IevBXYN1x95FiJ2doXtolX/ysdmbGA97xl18KJp7sNUj6bzkihdKLMUZiYZa
 zEXFiQDTGZvxkwIAAA==
X-CMS-MailID: 20200418041321epcas2p1ceed010fde93a35e763a9db436e1c63b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200418041321epcas2p1ceed010fde93a35e763a9db436e1c63b
References: <CGME20200418041321epcas2p1ceed010fde93a35e763a9db436e1c63b@epcas2p1.samsung.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

snd_soc_dapm_kcontrol widget which is created by autodisable control
should contain correct on_val, mask and shift because it is set when the
widget is powered and changed value is applied on registers by following
code in dapm_seq_run_coalesced().

		mask |= w->mask << w->shift;
		if (w->power)
			value |= w->on_val << w->shift;
		else
			value |= w->off_val << w->shift;

Shift on the mask in dapm_kcontrol_data_alloc() is removed to prevent
double shift.
And, on_val in dapm_kcontrol_set_value() is modified to get correct
value in the dapm_seq_run_coalesced().

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-dapm.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index a4143ca190d0..e2632841b321 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -423,7 +423,7 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 
 			memset(&template, 0, sizeof(template));
 			template.reg = e->reg;
-			template.mask = e->mask << e->shift_l;
+			template.mask = e->mask;
 			template.shift = e->shift_l;
 			template.off_val = snd_soc_enum_item_to_val(e, 0);
 			template.on_val = template.off_val;
@@ -546,8 +546,22 @@ static bool dapm_kcontrol_set_value(const struct snd_kcontrol *kcontrol,
 	if (data->value == value)
 		return false;
 
-	if (data->widget)
-		data->widget->on_val = value;
+	if (data->widget) {
+		switch (dapm_kcontrol_get_wlist(kcontrol)->widgets[0]->id) {
+		case snd_soc_dapm_switch:
+		case snd_soc_dapm_mixer:
+		case snd_soc_dapm_mixer_named_ctl:
+			data->widget->on_val = value & data->widget->mask;
+			break;
+		case snd_soc_dapm_demux:
+		case snd_soc_dapm_mux:
+			data->widget->on_val = value >> data->widget->shift;
+			break;
+		default:
+			data->widget->on_val = value;
+			break;
+		}
+	}
 
 	data->value = value;
 

base-commit: ecdcf8a833d770347115f739a37583cdc6ddbf7a
-- 
2.21.0


