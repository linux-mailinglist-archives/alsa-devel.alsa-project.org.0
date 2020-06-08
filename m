Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372AB1F1DD7
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 18:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D168B1661;
	Mon,  8 Jun 2020 18:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D168B1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591635154;
	bh=jarQlXIMyEgpDzCHnwhZ/Ic2auBBKSklH+JwJ3xa7B4=;
	h=Date:From:Subject:In-Reply-To:To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=M1sjIgnUhueZK8dBY6cQid8+lNv31ji+G/cWazAGKsF/1b8nZ4m80KkDNuIAS12ex
	 HTo4R1I23fmKqcHR5pEkKGAz9xq+vWIHmQ0hDCEtGXtNWnDdVCPxe4qM6YxUExsyar
	 7P5RFkpckX4CQEJ2RxHUxvuB8FvIFIceS8hjJiHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FADF801F7;
	Mon,  8 Jun 2020 18:50:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F737F8021C; Mon,  8 Jun 2020 18:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B22DF80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 18:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B22DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="WIBIrIjA"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 49gfQ936Zrz9Y;
 Mon,  8 Jun 2020 18:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1591635041; bh=jarQlXIMyEgpDzCHnwhZ/Ic2auBBKSklH+JwJ3xa7B4=;
 h=Date:From:Subject:In-Reply-To:To:Cc:From;
 b=WIBIrIjAnzgKDgG6E50IKD77VgKzVIV8iGsIicqtwyayhblgJCDpssMGVGb/e9f3Q
 /L/Rm/NAJETHnUPdke3Ps44VsduuhUW/Fzta2QM5AvGLrDnxMlmdIR74cMlgZwyfKh
 nCo7zoOqxB1MVIpBbDgs2gyc6DTwyF/ZsO+yKF8k5dJXovvNPnk9tQAuqChINds6S9
 NUc+zFDdLdRknF8msc3kZfihqczV5tR+yJL+wwU3wqtg/asdXvuc02vC9g7PFDv95F
 R1kJBfR40X1Hx98FG5ajsIp5DR1bHue0BBA0lsVFkxKQLW4mCD1w+frrNl7NyOnTxu
 5MHfL6Api4IGg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date: Mon, 08 Jun 2020 18:50:39 +0200
Message-Id: <89c4a2487609a0ed6af3ecf01cc972bdc59a7a2d.1591634956.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2] ALSA: pcm: disallow linking stream to itself
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
In-Reply-To: <s5h4krl67vb.wl-tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Prevent SNDRV_PCM_IOCTL_LINK linking stream to itself - the code
can't handle it. Fixed commit is not where bug was introduced, but
changes the context significantly.

Cc: stable@vger.kernel.org
Fixes: 0888c321de70 ("pcm_native: switch to fdget()/fdput()")
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
v2: EDEADLK -> EINVAL
---
 sound/core/pcm_native.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index aef860256278..434e7b604bad 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2166,6 +2166,12 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	}
 	pcm_file = f.file->private_data;
 	substream1 = pcm_file->substream;
+
+	if (substream == substream1) {
+		res = -EINVAL;
+		goto _badf;
+	}
+
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group) {
 		res = -ENOMEM;
-- 
2.20.1

