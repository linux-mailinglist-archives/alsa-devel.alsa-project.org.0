Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6919912F5A6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:42:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 036B21766;
	Fri,  3 Jan 2020 09:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 036B21766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040971;
	bh=2jEnE52DpJJn0Nyf/XgIhGS/eQAfRYdiZd0fd41vNqY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/BaSgPRg4ejnMBedwO+0jEoPQg6zrId2XkQ78SMVw6e6HoHQr7Fb0/yssaxOX3tL
	 me86DIF1n39LLgWvHG/wTJMwcg2OZxMDocqc09oHSqf7Cr9Pm51RF3FCSPUs03Ki8I
	 5tjz9FiDFE9OiET/GYW+6p+LKgn/MoA0VV7wp6hU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DD0EF80446;
	Fri,  3 Jan 2020 09:19:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 879B4F80377; Fri,  3 Jan 2020 09:18:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B6C3F802A0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B6C3F802A0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C03DB27C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:55 +0100
Message-Id: <20200103081714.9560-40-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 39/58] ALSA: sparc: Constify snd_kcontrol_new
	items
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Most of snd_kcontrol_new definitions are read-only and passed as-is.
Let's declare them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/amd7930.c | 2 +-
 sound/sparc/cs4231.c  | 2 +-
 sound/sparc/dbri.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index 916bed46be06..9d0da5fa1c70 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -837,7 +837,7 @@ static int snd_amd7930_put_volume(struct snd_kcontrol *kctl, struct snd_ctl_elem
 	return change;
 }
 
-static struct snd_kcontrol_new amd7930_controls[] = {
+static const struct snd_kcontrol_new amd7930_controls[] = {
 	{
 		.iface		=	SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name		=	"Monitor Volume",
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index b0e5b4a83a26..59f812b5ce59 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -1479,7 +1479,7 @@ static int snd_cs4231_put_double(struct snd_kcontrol *kcontrol,
   .private_value = (left_reg) | ((right_reg) << 8) | ((shift_left) << 16) | \
 		   ((shift_right) << 19) | ((mask) << 24) | ((invert) << 22) }
 
-static struct snd_kcontrol_new snd_cs4231_controls[] = {
+static const struct snd_kcontrol_new snd_cs4231_controls[] = {
 CS4231_DOUBLE("PCM Playback Switch", 0, CS4231_LEFT_OUTPUT,
 		CS4231_RIGHT_OUTPUT, 7, 7, 1, 1),
 CS4231_DOUBLE("PCM Playback Volume", 0, CS4231_LEFT_OUTPUT,
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 1390a52d6cfd..aaa1493b9ef9 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2410,7 +2410,7 @@ static int snd_cs4215_put_single(struct snd_kcontrol *kcontrol,
   .private_value = (entry) | ((shift) << 8) | ((mask) << 16) |	\
 			((invert) << 24) },
 
-static struct snd_kcontrol_new dbri_controls[] = {
+static const struct snd_kcontrol_new dbri_controls[] = {
 	{
 	 .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	 .name  = "Playback Volume",
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
