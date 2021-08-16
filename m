Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC33EDA8E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 18:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C24716BB;
	Mon, 16 Aug 2021 18:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C24716BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629130129;
	bh=HOHrwgvrUnWcG+GjHLteQdDPNtwLQmMUMzRrjAvuE20=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HDHvj4DsqJjMRWbHOCd7WpfOvjuKaUDhodF3Ht7OOpwCm7tgou4jNfr0H7irkjLp2
	 KdyfQDXUfVUpTzI05ueDTpssuRYBwfV68Gz/PazT1EdRo8SnQVrdHsYKsaZK2xM7En
	 WiGO/v5nxj+p3yA6GzeDfVcVe37ehwTJRV/duAzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B043F80425;
	Mon, 16 Aug 2021 18:07:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C58EF80425; Mon, 16 Aug 2021 18:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8775F80154
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 18:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8775F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="ROkbjOJW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RtV4avW87miuQJKhWG8x5vtWsvVLL2pYrQY0bf9KeuY=; b=ROkbjOJWk9yNOYFCJZMu2Jgptv
 HVDjxvZgh3P9IAhfcmjZ9MxgPY6iute1PNOURbA3jXU8Y+lWdlkyi+Kv3mOkT42PzZNCbR+Y7Ll7N
 axwjhfjJW4U4hMw3KILiQQxX5kf3MffLmhbz84eLHY5E7RLcq0oTnsFqU/4QrbJwki8HXNkv2Ww+3
 F3dh/QO16oWUZ/hM5EFzpEMQ8yVgg8WQdyjmRu7puIR1WQCK4t+puNnR1bR0162rgBRjVCoJFgyPB
 em03GnRGyoR1aWFEhDEEv/oxaMONtgBZztCBbKAYazcnOiGF7a21cHMOSE2g01vqIjkNsmQ6mQeEG
 0WNFne3A==;
Received: from c83-254-143-147.bredband.tele2.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <coding@diwic.se>)
 id 1mFf8d-0044Nq-9G; Mon, 16 Aug 2021 18:06:59 +0200
From: David Henningsson <coding@diwic.se>
To: tiwai@suse.de,
	perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] Add test for rawmidi framing API
Date: Mon, 16 Aug 2021 18:06:25 +0200
Message-Id: <20210816160625.17796-3-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816160625.17796-1-coding@diwic.se>
References: <20210816160625.17796-1-coding@diwic.se>
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

Signed-off-by: David Henningsson <coding@diwic.se>
---
 test/rawmidi.c | 65 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/test/rawmidi.c b/test/rawmidi.c
index 67f585b0..1090d44b 100644
--- a/test/rawmidi.c
+++ b/test/rawmidi.c
@@ -13,6 +13,7 @@ static void usage(void)
 	fprintf(stderr, "    -o device-id : test ALSA output device\n");
 	fprintf(stderr, "    -I node      : test input node\n");
 	fprintf(stderr, "    -O node      : test output node\n");
+	fprintf(stderr, "    -c clock     : kernel clock type (0=none, 1=realtime, 2=monotonic, 3=monotonic raw)\n");
 	fprintf(stderr, "    -t: test midi thru\n");
 	fprintf(stderr, "  example:\n");
 	fprintf(stderr, "    rawmidi -i hw:0,0 -O /dev/midi1\n");
@@ -37,7 +38,8 @@ int main(int argc,char** argv)
 	char *device_out = NULL;
 	char *node_in = NULL;
 	char *node_out = NULL;
-	
+	int clock_type = -1;
+
 	int fd_in = -1,fd_out = -1;
 	snd_rawmidi_t *handle_in = 0,*handle_out = 0;
 	
@@ -58,6 +60,10 @@ int main(int argc,char** argv)
 				case 't':
 					thru = 1;
 					break;
+				case 'c':
+					if (i + 1 < argc)
+						clock_type = atoi(argv[++i]);
+					break;
 				case 'i':
 					if (i + 1 < argc)
 						device_in = argv[++i];
@@ -133,20 +139,67 @@ int main(int argc,char** argv)
 		}		
 	}
 
-
-
 	if (!thru) {
 		if (handle_in || fd_in!=-1) {
+			if (clock_type != -1) {
+				snd_rawmidi_params_t *params;
+				snd_rawmidi_params_malloc(&params);
+				if (!handle_in) {
+					fprintf(stderr, "-c only usable with -i");
+					clock_type = -1;
+				}
+				if (clock_type != -1) {
+					fprintf(stderr, "Enable kernel clock type %d\n", clock_type);
+					snd_rawmidi_params_current(handle_in, params);
+					err = snd_rawmidi_params_set_framing_type(handle_in, params, 1);
+					if (err) {
+						fprintf(stderr,"snd_rawmidi_params_set_framing_type failed: %d\n", err);
+						clock_type = -1;
+					}
+				}
+				if (clock_type != -1) {
+					err = snd_rawmidi_params_set_clock_type(handle_in, params, clock_type);
+					if (err) {
+						fprintf(stderr, "snd_rawmidi_params_set_clock_type failed: %d\n", err);
+						clock_type = -1;
+					}
+				}
+				if (clock_type != -1) {
+					err = snd_rawmidi_params(handle_in, params);
+					if (err) {
+						fprintf(stderr, "snd_rawmidi_params failed: %d\n", err);
+						clock_type = -1;
+					}
+				}
+				snd_rawmidi_params_free(params);
+			}
+
 			fprintf(stderr,"Read midi in\n");
 			fprintf(stderr,"Press ctrl-c to stop\n");
 		}
 
 		if (handle_in) {
 			unsigned char ch;
+			snd_rawmidi_framing_tstamp_t frame;
 			while (!stop) {
-				snd_rawmidi_read(handle_in,&ch,1);
-				if (verbose) {
-					fprintf(stderr,"read %02x\n",ch);
+				if (clock_type != -1) {
+					snd_rawmidi_read(handle_in, &frame, sizeof(frame));
+					if (verbose) {
+						int i;
+						if (frame.frame_type) {
+							fprintf(stderr, "read unknown frame %d", frame.frame_type);
+							continue;
+						}
+						fprintf(stderr, "read [%lld:%09d]", frame.tv_sec, frame.tv_nsec);
+						for (i = 0; i < frame.length; i++)
+							fprintf(stderr, " %02x", frame.data[i]);
+						fprintf(stderr, "\n");
+					}
+				}
+				else {
+					snd_rawmidi_read(handle_in,&ch,1);
+					if (verbose)
+						fprintf(stderr,"read %02x\n",ch);
 				}
 			}
 		}
-- 
2.25.1

