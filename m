Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82599557835
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 12:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196411A8F;
	Thu, 23 Jun 2022 12:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196411A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655981551;
	bh=JNcZJqeg2dn0aJ2qs4eAV9NOQM5uAtv9zcBW0sueo4Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jgTXJhp6gCYtHFSG3QfWBqFPuWES2SKj9W2FO+E/CFLUKb7GBM+QqgD7cIoIBYsLh
	 vz/cJV81FHciqj9HpOk7Z0kfeMJfED5h4rTkXAChD+1nWZ/CrMJhjzM+OQHuqBJd3i
	 87mBuuW9HwxsdcQVJcQrDyZeObvL3aXaOENpOFoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 641E6F8052E;
	Thu, 23 Jun 2022 12:51:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E432CF804D6; Thu, 23 Jun 2022 12:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDC53F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC53F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d2oMzTum"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25N5GHiA005483;
 Thu, 23 Jun 2022 05:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=Yc/c1yumefCJ4LX+6KTEfk9eNhDXY/b2YTGdnEZv32I=;
 b=d2oMzTumXsEV2dgRMP/oVf21Xbd+YV2fG3LR9EECr5u+DPxjqvCtPCFGnvPqq9u6u6J5
 rOYbA24urdy2TGoMMtcWQ5ZqE5MBbwHanUBwJ09Imf0qc/70Y1PFro8P0jHnYmjPt9VU
 aIeXjd9c3TG0GrpugcJdwC4zjpZVY0ZXUG9gjVIJhKgwENXwfM1TEHwUsOk6ube1+jWb
 YNTQeIGzZApfAYETYFNXAja7cOeSaOGjrYOmNUWNfr9cDO7ieDXT1Z5QIWJj1Umynous
 MCxOuwEOdQuFG7Xlho+gDij7WLWH7f8vNte//UblIB3lkcxYUGuTL6vB6T7eorAQXE43 6Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p6pkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 05:51:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 11:51:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 11:51:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2E141478;
 Thu, 23 Jun 2022 10:51:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: dapm: Initialise kcontrol data for mux/demux
 controls
Date: Thu, 23 Jun 2022 11:51:15 +0100
Message-ID: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KwGg4DYMYHVZ_4afJPVsb4OeEpRKMVcx
X-Proofpoint-ORIG-GUID: KwGg4DYMYHVZ_4afJPVsb4OeEpRKMVcx
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

DAPM keeps a copy of the current value of mux/demux controls,
however this value is only initialised in the case of autodisable
controls. This leads to false notification events when first
modifying a DAPM kcontrol that has a non-zero default.

Autodisable controls are left as they are, since they already
initialise the value, and there would be more work required to
support autodisable muxes where the first option isn't disabled
and/or that isn't the default.

Technically this issue could affect mixer/switch elements as well,
although not on any of the devices I am currently running. There
is also a little more work to do to address the issue there due to
that side supporting stereo controls, so that has not been tackled
in this patch.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 869c76506b669..a8e842e02cdc2 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -62,6 +62,8 @@ struct snd_soc_dapm_widget *
 snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 			 const struct snd_soc_dapm_widget *widget);
 
+static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg);
+
 /* dapm power sequences - make this per codec in the future */
 static int dapm_up_seq[] = {
 	[snd_soc_dapm_pre] = 1,
@@ -442,6 +444,9 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 
 			snd_soc_dapm_add_path(widget->dapm, data->widget,
 					      widget, NULL, NULL);
+		} else if (e->reg != SND_SOC_NOPM) {
+			data->value = soc_dapm_read(widget->dapm, e->reg) &
+				      (e->mask << e->shift_l);
 		}
 		break;
 	default:
-- 
2.30.2

