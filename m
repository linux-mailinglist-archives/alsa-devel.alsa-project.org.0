Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7603EECDB
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 14:54:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B041683;
	Tue, 17 Aug 2021 14:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B041683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629204840;
	bh=93H/Bl3tvzo2/7LaIskWg0eB/fEr0vRwbw2h76IUyWs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3sk+SsWcEwmJbqSGEiyYUMSrPjjrdLf7EOCjAnqaDnIH2SZ6osrZLqQGu1dL5SBn
	 c6kcwRvAu2Y3cFWyNaFwmpKOL7aLKN2FuCX/5zsOgDww2EK+mIfZpIlc5HB8tXMkRg
	 vn2DczxAPbLzd9MUZs9MqoTTjHCF0csB+2lQW4Cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E34CF804E4;
	Tue, 17 Aug 2021 14:52:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 112BCF804DA; Tue, 17 Aug 2021 14:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49C9FF802C4
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 14:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49C9FF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="RVxUy2i+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rylYG2wCpd7lY70YRMKs49j3We6VXqSIQYSpyRsGnjI=; b=RVxUy2i+fSwaGzQqOLFx4xzE/A
 o5sw3HFLbGn8svjY9Dly3TH8MoCBflfJVSOEi7fjz7Ces2mqhLVmHKlqqIi6Zowfc3uKOsBVcCWE/
 l+wQ3ItWN8R3B7tUSRxmIe2IQ13n3WzcuB5IE80oF99MEUL4wZOfHPY7ttfkklrO87ozMjTka0gR6
 dJktSqC151wvt4d1IzZaWxm9x6yyjtc+5kQeZHUNFz762eOvwk9XNtYnj45pmY8lmMLk+H8J1YpuZ
 lscA45AyvJHDoSLVG/g2pFFZc6kgp/jKXAsOVrOI84CITK8yx/tUQ3smr6jbs1eJkSMMMG3+iuSdR
 JmV/cjwA==;
Received: from c83-254-143-147.bredband.tele2.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <coding@diwic.se>)
 id 1mFyZD-00DMgr-ID; Tue, 17 Aug 2021 14:51:43 +0200
From: David Henningsson <coding@diwic.se>
To: tiwai@suse.de,
	alsa-devel@alsa-project.org,
	perex@perex.cz
Subject: [PATCH v2 2/2] Add test for rawmidi framing API
Date: Tue, 17 Aug 2021 14:51:32 +0200
Message-Id: <20210817125132.5737-3-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817125132.5737-1-coding@diwic.se>
References: <20210817125132.5737-1-coding@diwic.se>
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

Adds a "clock type" parameter to the "rawmidi" test program, that when
used and combined with -i (and -v to be useful), activates tstamp type
framing with the specified clock type.

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

