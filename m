Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D517AC9D4A
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Jun 2025 00:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6195060202;
	Sun,  1 Jun 2025 00:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6195060202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748731349;
	bh=R1lHCGST9MdtteCbLmCHl+L/QVmRvDYrCJqdy0W46Eo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vCXNaVtPD1/LdG+pOZTr5bSj+Zk3Js5HUbqiClLwz6ijFlGwZj1E6QLxF5aUWuNHU
	 95rIAP+jS45JDsT4UUrBspvAlRJ4DqAM8llQ2wvDGclM9N6V48gIhpCCYYyOWA+dUr
	 PaHUmC9MB6ig7BYWqetqIglkNQ+Isi0Z1RXr47Lo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8477FF805B6; Sun,  1 Jun 2025 00:41:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D5FF805B5;
	Sun,  1 Jun 2025 00:41:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA4C8F8013D; Sun,  1 Jun 2025 00:41:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0478CF8013D
	for <alsa-devel@alsa-project.org>; Sun,  1 Jun 2025 00:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0478CF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1844bddc59f45200-webhooks-bot@alsa-project.org>
In-Reply-To: <1844bddc596a4000-webhooks-bot@alsa-project.org>
References: <1844bddc596a4000-webhooks-bot@alsa-project.org>
Subject: aseqsend silently fails (ENODEV) with hardware port
Date: Sun,  1 Jun 2025 00:41:51 +0200 (CEST)
Message-ID-Hash: UC6LQBAFDUP3K7XSGBDHYXE3GD5WPDQU
X-Message-ID-Hash: UC6LQBAFDUP3K7XSGBDHYXE3GD5WPDQU
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UC6LQBAFDUP3K7XSGBDHYXE3GD5WPDQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #300 was opened from michaelforney:

When I use `aseqsend` to send a sysex message to a device, it doesn't seem to work, though there is no error message. Running with strace, it seems it is failing with ENODEV.

```sh
$ strace aseqsend -p 32:0 'F0 43 7D 10 41 30 01 00 00 01 F7'
...
open("/dev/snd/seq", O_WRONLY|O_LARGEFILE|O_CLOEXEC) = 3
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
ioctl(3, SNDRV_SEQ_IOCTL_PVERSION, 0x7fffef1ae678) = 0
ioctl(3, SNDRV_SEQ_IOCTL_USER_PVERSION, 0x7fffef1ae67c) = 0
mmap(NULL, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f6ae25f7000
ioctl(3, SNDRV_SEQ_IOCTL_CLIENT_ID, 0x7fffef1ae67c) = 0
ioctl(3, SNDRV_SEQ_IOCTL_RUNNING_MODE, 0x7fffef1ae680) = 0
ioctl(3, SNDRV_SEQ_IOCTL_GET_CLIENT_INFO, 0x7fffef1ae940) = 0
ioctl(3, SNDRV_SEQ_IOCTL_SET_CLIENT_INFO, 0x7fffef1ae940) = 0
ioctl(3, SNDRV_SEQ_IOCTL_GET_CLIENT_INFO, 0x7fffef1ae940) = 0
ioctl(3, SNDRV_SEQ_IOCTL_SET_CLIENT_INFO, 0x7fffef1ae940) = 0
ioctl(3, SNDRV_SEQ_IOCTL_CREATE_PORT, 0x7fffef1ae960) = 0
write(3, "\202\4\0\375\0\0\0\0\0\0\0\0\0\0 \0\v\0\0\0\320\212WN\361U\0\0\360C}\20"..., 39) = -1 ENODEV (No such device)
nanosleep({tv_sec=0, tv_nsec=1000000}, 0x7fffef1aea20) = 0
close(3)                                = 0
munmap(0x7f6ae25f7000, 20480)           = 0
exit_group(0)                           = ?
+++ exited with 0 +++
$
```

`amidi -S ...` works as expected. If I modify `aseqsend` to first subscribe to the port, it seems to work:

```diff
diff --git a/seq/aseqsend/aseqsend.c b/seq/aseqsend/aseqsend.c
index 92354eb..ad0a636 100644
--- a/seq/aseqsend/aseqsend.c
+++ b/seq/aseqsend/aseqsend.c
@@ -364,6 +364,7 @@ int main(int argc, char *argv[])
 	char do_port_list = 0;
 	char verbose = 0;
 	int k;
+	int err;
 
 	while ((c = getopt_long(argc, argv, "hi:Vvlp:s:u:", long_options, NULL)) != -1) {
 		switch (c) {
@@ -439,6 +440,8 @@ int main(int argc, char *argv[])
 		error("Unable to parse port name!");
 		exit(EXIT_FAILURE);
 	}
+	err = snd_seq_connect_to(seq, 0, addr.client, addr.port);
+	check_snd("connect to port", err);
 
 	sent_data_c = 0; //counter of actually sent bytes
```

>From what I've read, I don't think it should be necessary to subscribe to a port to send it messages. However, I did find one sentence in the alsa-lib docs that seem to indicate that it is needed for hardware ports:
> There is another subscription type for opposite direction: Suppose a MIDI sequencer program which sends events to a MIDI output device. In ALSA system, MIDI device is not opened until the associated MIDI port is accessed. Thus, in order to activate MIDI device, we have to subscribe to MIDI port for write. After this connection is established, events will be properly sent to MIDI output device.

This seems to be a pretty basic use of `aseqsend`, so I am a bit surprised that it wasn't working. Is the subscription the right way to fix the problem, or am I doing something else wrong?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/300
Repository URL: https://github.com/alsa-project/alsa-utils
