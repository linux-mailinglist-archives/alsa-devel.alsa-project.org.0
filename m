Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A552E0C4A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 16:00:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B073A16F6;
	Tue, 22 Dec 2020 15:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B073A16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608649229;
	bh=HSeGcJN2xo41UualUyNyBkaMyBGE1gtrXChsGGtll8U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MC/YrJxxMzehIn08NSvm35eozVhLmH3pAm2T1s9T8KhUAvxB6XT3OOGKRiE6QETQa
	 XDmUcRv7eGqCF767pQBDVZjo3rVqvQuw9zvKsu2a8bXfCophRjh44MyNkNqZf/daFx
	 +GnwhU5Y2NEyJeY17Q01ErJalQWjPu9hzCZCD7xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D25B2F804C1;
	Tue, 22 Dec 2020 15:58:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9497F8023E; Tue, 22 Dec 2020 15:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43084F80234
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 15:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43084F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="IKsuAiav"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VR6PROE3UAZhTPZUHmClcZlsc2pwjHxRO69uuiuTqhs=; b=IKsuAiavuA9/iHQOSDnezlmWwK
 TY7c/kNB+qvm1MF8BycKH8EEJ9h/ZPE3PTK61qPWK+MkhBIy21PpPv9u0RY7wcCGwhTJMNr/RWdMi
 lt0L8k+m2ikN4R2Z1ljNMKs+SDwQBOJa0HT/vdToej/oMXSftl4A0pZ/66z/7R7NHCII9ujR7yZ8U
 URSMQ3aAtJTja1Kv0sB0oSdUgA5NpLFy1B8j7m6DgPBKN5twyiXD0OA3V59hQBzf94ckfBeGbsDjP
 GpsQnQm7zsLredd3zpCmbQvHK96kmCOanTd3wurkavslb2zeq6BCPIQwOqyPlCnkvsht0qGkvmBt4
 d1gdPYbg==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1krj6q-00FQMk-C6; Tue, 22 Dec 2020 15:57:56 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 2/2] test/audio_time: Make use of SND_PCM_AUDIO_TSTAMP_TYPE
 constants
Date: Tue, 22 Dec 2020 15:57:28 +0100
Message-Id: <20201222145728.9368-3-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222145728.9368-1-coding@diwic.se>
References: <20201222145728.9368-1-coding@diwic.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: coding@diwic.se
Cc: David Henningsson <coding@diwic.se>
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

Also fixup the usage row which seemed wrong to me.

Signed-off-by: David Henningsson <coding@diwic.se>
---
 test/audio_time.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/test/audio_time.c b/test/audio_time.c
index 530922d9..e4d4a944 100644
--- a/test/audio_time.c
+++ b/test/audio_time.c
@@ -32,7 +32,7 @@ static void usage(char *command)
 		"-d, --delay             add delay \n"
 		"-D, --device=NAME       select PCM by name \n"
 		"-p, --playback          playback tstamps \n"
-		"-t, --ts_type=TYPE      Default(0),link(1),link_estimated(2),synchronized(3) \n"
+		"-t, --ts_type=TYPE      Compat(0),default(1),link(2),link_absolute(3),link_estimated(4),link_synchronized(5) \n"
 		"-r, --report            show audio timestamp and accuracy validity\n"
 		, command);
 }
@@ -201,17 +201,17 @@ int main(int argc, char *argv[])
 			goto _exit;
 		}
 
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, 0))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, SND_PCM_AUDIO_TSTAMP_TYPE_COMPAT))
 			printf("Playback supports audio compat timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, 1))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, SND_PCM_AUDIO_TSTAMP_TYPE_DEFAULT))
 			printf("Playback supports audio default timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, 2))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, SND_PCM_AUDIO_TSTAMP_TYPE_LINK))
 			printf("Playback supports audio link timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, 3))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ABSOLUTE))
 			printf("Playback supports audio link absolute timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, 4))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ESTIMATED))
 			printf("Playback supports audio link estimated timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, 5))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_p, SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED))
 			printf("Playback supports audio link synchronized timestamps\n");
 
 		snd_pcm_sw_params_alloca(&swparams_p);
@@ -269,17 +269,17 @@ int main(int argc, char *argv[])
 			goto _exit;
 		}
 
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, 0))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, SND_PCM_AUDIO_TSTAMP_TYPE_COMPAT))
 			printf("Capture supports audio compat timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, 1))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, SND_PCM_AUDIO_TSTAMP_TYPE_DEFAULT))
 			printf("Capture supports audio default timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, 2))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, SND_PCM_AUDIO_TSTAMP_TYPE_LINK))
 			printf("Capture supports audio link timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, 3))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ABSOLUTE))
 			printf("Capture supports audio link absolute timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, 4))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ESTIMATED))
 			printf("Capture supports audio link estimated timestamps\n");
-		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, 5))
+		if (snd_pcm_hw_params_supports_audio_ts_type(hwparams_c, SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED))
 			printf("Capture supports audio link synchronized timestamps\n");
 
 		snd_pcm_sw_params_alloca(&swparams_c);
-- 
2.25.1

