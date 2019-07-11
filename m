Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2425465E4D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 19:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910E51672;
	Thu, 11 Jul 2019 19:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910E51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562865312;
	bh=fCiyWfcaIuQigzy5DJGYWzhkyHGQeSfuHBfW7169b1A=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dr9/LNUysSUioQItaP8ugItEfiJz3rSNU+xQ1hf10wQ12KimsM2QDQuJ80kYIE53q
	 9Bb86ZQQ7iYWSIzBniIDb8IZ31LP1K60LtzgzuF8qbZEnieH0sZO6IHr2mLyZhPaWp
	 A6rNt+Lz/U6nw4qhEI938Ic/LMEK4Jv/7RKmWbyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC27F80306;
	Thu, 11 Jul 2019 19:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE7A3F802FB; Thu, 11 Jul 2019 19:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C23E6F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 19:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23E6F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cVLvDXf7"
Received: by mail-pg1-x543.google.com with SMTP id f25so3238910pgv.10
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=3BwU5VUAF0JCMzSqok1tl/llhm5KGPd/qDOXI6NcGqQ=;
 b=cVLvDXf7lEbJm1xTumokzjX8xvvH/V50wlFXN8tgKkY8uPL34hAGnWF7HOsGitjkqX
 8ADm88GAnLkpJhhLNslnzh59oW+pkjENrNJA1nvStYiOee2k7Gjltb1KRtGnvTapWEX9
 pZ/rMkO3tuErbjlwTDGxVmK8tNUhrl8se5RBhMnjxSJ2QmVJ6rGWMGW9GzKiFMDGNs24
 D8QTUtLEyJDbdN0dGai1euN7SNVoDY5JZruX7CxJkaFAescjeWKYZd7Bh0r+yJKj92Sk
 fSNZ7EInbbdgIbA3JF22tKYtIfs4GSqd2fJwfZcTvIwJKOdjaXgf7bYnFHAi9vfxgS4v
 pB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=3BwU5VUAF0JCMzSqok1tl/llhm5KGPd/qDOXI6NcGqQ=;
 b=DKwrQU+Vcz/EsFtPukvohyZAj8PQg0Cv7ECWlEwFSBcOqqUgNhy+3XBemu25NxS03Z
 FtZAVjJJHFjWAaaCZUrgzi3rvR+JZVCWNvuV9i5RIaxgm2n/K+aL4/X4ov6rt1cdx2jv
 TulvqekIwr9X9ltBsQWnBUMutlFIOXulklZoAI0CbTC8AEOnWtpulk0td+TNOlvbqLDA
 8ZZ8XREIekTmcNxoE10QA+35KJ1JYvY5tOCSbdhJQrlDBZIx67Glz8P6N8TIf2l03Ldm
 7KiKpVZX4AvakjUDnfIP2MYPKrDDACXoVbdi7rERt14drPTukAzInAmjQF55W+tzlwve
 2tGg==
X-Gm-Message-State: APjAAAXmFsHZCDdbe1cLjvzx7OQKbGiWquxPX5ozlP0jNmW7++JdfUna
 ccZdOYKeRJaMOHZQLOQc6RY=
X-Google-Smtp-Source: APXvYqwV2pfHsALRPjvfCplIdA5zsECBYJGwyAdmquJN8p+FJJ/6eR6ilYh1DX7TRvGyMuwUCuk6Dg==
X-Received: by 2002:a65:648e:: with SMTP id e14mr5629964pgv.317.1562865191372; 
 Thu, 11 Jul 2019 10:13:11 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id 185sm5994081pfd.125.2019.07.11.10.13.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:13:10 -0700 (PDT)
Date: Thu, 11 Jul 2019 22:43:02 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Armijn Hemel <armijn@tjaldur.nl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190711171302.GA3445@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: pci: au88x0: Remove unneeded variable:
	"changed"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix below issues reported by coccicheck

sound/pci/au88x0/au88x0_a3d.c:821:8-15: Unneeded variable: "changed".
Return "1" on line 834
sound/pci/au88x0/au88x0_a3d.c:768:5-12: Unneeded variable: "changed".
Return "1" on line 777
sound/pci/au88x0/au88x0_a3d.c:804:5-12: Unneeded variable: "changed".
Return "1" on line 813
sound/pci/au88x0/au88x0_a3d.c:786:8-15: Unneeded variable: "changed".
Return "1" on line 796

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/pci/au88x0/au88x0_a3d.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_a3d.c b/sound/pci/au88x0/au88x0_a3d.c
index 7347103..2db183f 100644
--- a/sound/pci/au88x0/au88x0_a3d.c
+++ b/sound/pci/au88x0/au88x0_a3d.c
@@ -765,7 +765,7 @@ snd_vortex_a3d_hrtf_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	a3dsrc_t *a = kcontrol->private_data;
-	int changed = 1, i;
+	int i;
 	int coord[6];
 	for (i = 0; i < 6; i++)
 		coord[i] = ucontrol->value.integer.value[i];
@@ -774,7 +774,7 @@ snd_vortex_a3d_hrtf_put(struct snd_kcontrol *kcontrol,
 	vortex_a3d_coord2hrtf(a->hrtf[1], coord);
 	a3dsrc_SetHrtfTarget(a, a->hrtf[0], a->hrtf[1]);
 	a3dsrc_SetHrtfCurrent(a, a->hrtf[0], a->hrtf[1]);
-	return changed;
+	return 1;
 }
 
 static int
@@ -783,7 +783,7 @@ snd_vortex_a3d_itd_put(struct snd_kcontrol *kcontrol,
 {
 	a3dsrc_t *a = kcontrol->private_data;
 	int coord[6];
-	int i, changed = 1;
+	int i;
 	for (i = 0; i < 6; i++)
 		coord[i] = ucontrol->value.integer.value[i];
 	/* Translate orientation coordinates to a3d params. */
@@ -793,7 +793,7 @@ snd_vortex_a3d_itd_put(struct snd_kcontrol *kcontrol,
 	a3dsrc_SetItdTarget(a, a->itd[0], a->itd[1]);
 	a3dsrc_SetItdCurrent(a, a->itd[0], a->itd[1]);
 	a3dsrc_SetItdDline(a, a->dline);
-	return changed;
+	return 1;
 }
 
 static int
@@ -801,7 +801,6 @@ snd_vortex_a3d_ild_put(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
 	a3dsrc_t *a = kcontrol->private_data;
-	int changed = 1;
 	int l, r;
 	/* There may be some scale tranlation needed here. */
 	l = ucontrol->value.integer.value[0];
@@ -810,7 +809,7 @@ snd_vortex_a3d_ild_put(struct snd_kcontrol *kcontrol,
 	/* Left Right panning. */
 	a3dsrc_SetGainTarget(a, l, r);
 	a3dsrc_SetGainCurrent(a, l, r);
-	return changed;
+	return 1;
 }
 
 static int
@@ -818,7 +817,7 @@ snd_vortex_a3d_filter_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol)
 {
 	a3dsrc_t *a = kcontrol->private_data;
-	int i, changed = 1;
+	int i;
 	int params[6];
 	for (i = 0; i < 6; i++)
 		params[i] = ucontrol->value.integer.value[i];
@@ -831,7 +830,7 @@ snd_vortex_a3d_filter_put(struct snd_kcontrol *kcontrol,
 	a3dsrc_SetAtmosCurrent(a, a->filter[0],
 			       a->filter[1], a->filter[2],
 			       a->filter[3], a->filter[4]);
-	return changed;
+	return 1;
 }
 
 static const struct snd_kcontrol_new vortex_a3d_kcontrol = {
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
