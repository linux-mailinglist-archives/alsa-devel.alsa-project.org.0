Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521E1974E1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7D71671;
	Mon, 30 Mar 2020 09:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7D71671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585552160;
	bh=cYitUv0Z+HxpGpMpkYAp/o5OlW+AoysGUJDRHbAXVMU=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BW/l597vTn4c7dpapGn0AmXRpCFbG1ofvPVn/0UJlgL7nDflRl1UwMHknR5B6xpNM
	 wzu+avEnioyMw/q7103OAovYZ+/yYLXRW4PQJmWtIGSJqXdpSYipp9c4CoqYxf/rm/
	 hAO4F5QnJTUX56o1KPev2REuFAkad9hXdYPntWHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CB25F8022D;
	Mon, 30 Mar 2020 09:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79F33F80148; Mon, 30 Mar 2020 09:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12297F8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12297F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="UFw3yuqh"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200330070643epoutp02935e598014b6d65e04390690db33d7e9~BAyWChnZv1163011630epoutp029
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 07:06:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200330070643epoutp02935e598014b6d65e04390690db33d7e9~BAyWChnZv1163011630epoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585552003;
 bh=lZVcsO639biKOLxOMk9nBhc+HVBgBppflRsiaZ9WyeA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=UFw3yuqhgAJq0DMBeDiWqBwoineyd2kTFa1QIyNBm2QAkkqZJL194Xj/kwRevvq0k
 yrhDHR3FQRNM4w8y5AT2Z17ozL3oy4UhQe0vbBNEk5DiM6BhvSQYtelxKFyb/Dz2yD
 nymEZDpvdg87fnOPCZbxWe7iJ+kx+DnId0ThZj1Y=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200330070643epcas2p4487b84b8664f9c9c089f54ed168e640a~BAyVzGGdJ0516705167epcas2p4S;
 Mon, 30 Mar 2020 07:06:43 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.189]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48rNmd5yvHzMqYkV; Mon, 30 Mar
 2020 07:06:41 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 D4.5E.04105.E7A918E5; Mon, 30 Mar 2020 16:06:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200330070638epcas2p27ad39d4009e60435c65f30ca7a17f850~BAyRULzEK1066210662epcas2p2h;
 Mon, 30 Mar 2020 07:06:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200330070638epsmtrp29b376a7e5619aea704f6820c8a9c693e~BAyRThf3h2804028040epsmtrp2Q;
 Mon, 30 Mar 2020 07:06:38 +0000 (GMT)
X-AuditID: b6c32a47-15bff70000001009-94-5e819a7e4728
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D2.7A.04024.E7A918E5; Mon, 30 Mar 2020 16:06:38 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200330070638epsmtip1c7504a07aa35ffe8aa977ea9df35b4c3~BAyRKxWVG0893208932epsmtip1i;
 Mon, 30 Mar 2020 07:06:38 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 1/1] ASoC: dpcm: allow start or stop during pause for backend
Date: Mon, 30 Mar 2020 16:06:38 +0900
Message-ID: <000901d60661$c183c100$448b4300$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdYGYFfa3pb48cifSEKWYs7GW9JTBQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEJsWRmVeSWpSXmKPExsWy7bCmuW7drMY4gxPvDSyuXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLVI5NRmpiSmqRQmpecn5KZl66
 rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBOJYWyxJxSoFBAYnGxkr6dTVF+aUmq
 QkZ+cYmtUmpBSk6BoWGBXnFibnFpXrpecn6ulaGBgZEpUGVCTkbLmuvMBU+5K7qOfmJsYHzA
 2cXIySEhYCKx/utP1i5GLg4hgR2MEi0XX7FBOJ8YJS7ffswE4XxjlNj79B0LTEv/4V1Qib2M
 Et+XP2eHcF4ySjzd1w/kcHCwCVhJ9HQrgTSICDhKfD3WANbMLKAo8fjPHDBbWMBf4tXfblYQ
 m0VAVeLq7UNgcV4BS4kfx9rZIGxBiZMzn0D1GkksWT2fCcKWl9j+dg4zxEEKEj+fLmOF2KUn
 0f/3PStEjYjE7M42ZpDbJATWsElc7exnBblNQsBF4uU3Z4heYYlXx7ewQ9hSEp/f7WWDqG9m
 lHh39g9UYgqjRGe3EIRtLLFl7ikmiDnKEkduQd3GJ9Fx+C87RJhXoqMNqlpJYuOpf1DVEhLz
 NkAN9JC4+3sm+wRGxVlInpyF5MlZSJ6cheSZBYwsqxjFUguKc9NTi40KjJEjexMjOD1que9g
 3HbO5xCjAAejEg/vh+0NcUKsiWXFlbmHGCU4mJVEeNn8gUK8KYmVValF+fFFpTmpxYcYTYGR
 MJFZSjQ5H5i680riDU2NzMwMLE0tTM2MLJTEeTdx34wREkhPLEnNTk0tSC2C6WPi4JRqYJS6
 yvhrNdfDRa+OOzDtPXS3In7K4x2LvzYUljDJXojebTBdZaXi+4D9PTN0zUXn6IZMP7vmcLDH
 gxuneb1/L3mvayKy+bTXn/IDOysvH5pq7XVM8gu3zpZVrJHqBif570z9ZPYzyUqoOpbBize6
 bYmB7oy/Lx5U7ShaE64Qt9Ugq8zYveuO7yMlluKMREMt5qLiRACqDgWWpQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSnG7drMY4gyvfhCyuXDzEZDH14RM2
 i29XOpgsNnxfy+jA4rHhcxObx85Zd9k9Nq3qZPNYv+UqSwBLFJdNSmpOZllqkb5dAldGy5rr
 zAVPuSu6jn5ibGB8wNnFyMkhIWAi0X94F1MXIxeHkMBuRon9O1sZIRISEh/mn2GHsIUl7rcc
 YYUoes4ocWVbE1CCg4NNwEqip1sJpEZEwFXi/t4GsHpmAUWJx3/msIDYwgK+Ept2/AKLswio
 Sly9fQgszitgKfHjWDsbhC0ocXLmExaIXhOJxsPdULa8xPa3c5ghblCQ+Pl0GSvELj2J/r/v
 WSFqRCRmd7YxT2AUnIVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6
 yfm5mxjBYa+luYPx8pL4Q4wCHIxKPLwftjfECbEmlhVX5h5ilOBgVhLhZfMHCvGmJFZWpRbl
 xxeV5qQWH2KU5mBREud9mncsUkggPbEkNTs1tSC1CCbLxMEp1cCodfRAjMjZdEvnE9IKAutq
 JiSe8jxdlpguerqaUVo+0kWs6uCh8pxwv+Vvd6R5bH/88+XqQKOF3Adsq9fOX5gWuU4jMTKa
 yXXS6RrWcM/+y6y++8X388xWyS7JF7gha37I7UaQxZ+rD21f98T+OKre0hnpayfpLPiP5902
 +VdiVlmcWvEPqpVYijMSDbWYi4oTAVlZr0N3AgAA
X-CMS-MailID: 20200330070638epcas2p27ad39d4009e60435c65f30ca7a17f850
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330070638epcas2p27ad39d4009e60435c65f30ca7a17f850
References: <CGME20200330070638epcas2p27ad39d4009e60435c65f30ca7a17f850@epcas2p2.samsung.com>
Cc: alsa-devel@alsa-project.org
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

soc_compr_trigger_fe() allows start or stop after pause_push.
In dpcm_be_dai_trigger(), however, only pause_release is allowed
command after pause_push.
To fix this problem, SND_SOC_DPCM_STATE_PAUSED should be allowed
also for start or stop command.

Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
---
 sound/soc/soc-pcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c59b3688ca0..8f6f0ad50288 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2236,7 +2236,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime
*fe, int stream,
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
 			if ((be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_PREPARE) &&
-			    (be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_STOP))
+			    (be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_STOP) &&
+			    (be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
 			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
@@ -2266,7 +2267,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime
*fe, int stream,
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_STOP:
-			if (be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_START)
+			if ((be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_START) &&
+			    (be->dpcm[stream].state !=
SND_SOC_DPCM_STATE_PAUSED))
 				continue;
 
 			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
-- 
2.21.0


