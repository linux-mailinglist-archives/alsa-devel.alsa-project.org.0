Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C707370934A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E08D87F8;
	Fri, 19 May 2023 11:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E08D87F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488857;
	bh=zaXAwuiQYO0CiIxc3YiO2m4Y6/PalHhsF3YM7NCfLeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T6BvsvJitSs/pd5x0pgQG1wdYGhZe08U1A48VRaniEXGTjGJncX5B8KeE6IOWEEqY
	 4nzyhVwi4nGSbrIUluJ1mYAYcSRzbzUcUfnhPnr1taHBSBVGHGFIpqqAE0Iy0HVpFp
	 iXEYK13scXBQb3InSSuORWAtQVaCROyX4E6TsFTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E7EBF802E8; Fri, 19 May 2023 11:31:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 508CDF805CB;
	Fri, 19 May 2023 11:31:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20588F805AB; Fri, 19 May 2023 11:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44825F8025A
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44825F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=T8751m1n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xapZetBD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE1941FE3D;
	Fri, 19 May 2023 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488690;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5JM7aynpADpweyyiVqnN0EwV+i0ZMSlfggv+EXFiSh0=;
	b=T8751m1nsfPI5nGRskWjj24MWhECzBimiz4T1cRKqjFhfVXPWpniyI9UnwrOiRvxYnCfFs
	BSgjLpsS9Z81ux7uF9leYNUxG6o7GjMRIbYo3TB2Ze+0vtZUWzrH8XDimgbQeXlhIP78KX
	uz33mmVwU2BYkzHgkHeMhzuBp2llAuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5JM7aynpADpweyyiVqnN0EwV+i0ZMSlfggv+EXFiSh0=;
	b=xapZetBDUHuRha0Mh7xJV0WGtOnVb5/2mzr9OIXzDHxiZ1VXKEq3zzJZBgaxQjeUlNMlFV
	+a31hyjSrGeBXSDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A057713A12;
	Fri, 19 May 2023 09:31:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8ARuJPJBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 02/36] ALSA: rawmidi: Add ioctl callback to
 snd_rawmidi_global_ops
Date: Fri, 19 May 2023 11:30:40 +0200
Message-Id: <20230519093114.28813-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BUBG7GENBC4QB6FMY34H6KET74ZHZOEP
X-Message-ID-Hash: BUBG7GENBC4QB6FMY34H6KET74ZHZOEP
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A new callback, ioctl, is added to snd_rawmidi_global_ops for allowing
the driver to deal with the own ioctls.  This is another preparation
patch for the upcoming UMP support.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/rawmidi.h | 3 +++
 sound/core/rawmidi.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 52b1cbfb2526..a53cd063412c 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -32,6 +32,7 @@
 
 struct snd_rawmidi;
 struct snd_rawmidi_substream;
+struct snd_rawmidi_file;
 struct snd_seq_port_info;
 struct pid;
 
@@ -47,6 +48,8 @@ struct snd_rawmidi_global_ops {
 	int (*dev_unregister) (struct snd_rawmidi * rmidi);
 	void (*get_port_info)(struct snd_rawmidi *rmidi, int number,
 			      struct snd_seq_port_info *info);
+	long (*ioctl)(struct snd_rawmidi_file *rfile, unsigned int cmd,
+		      void __user *argp);
 };
 
 struct snd_rawmidi_runtime {
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 589b75087d27..1415f559b5d0 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -984,6 +984,8 @@ static long snd_rawmidi_ioctl(struct file *file, unsigned int cmd, unsigned long
 		}
 	}
 	default:
+		if (rfile->rmidi->ops && rfile->rmidi->ops->ioctl)
+			return rfile->rmidi->ops->ioctl(rfile, cmd, argp);
 		rmidi_dbg(rfile->rmidi,
 			  "rawmidi: unknown command = 0x%x\n", cmd);
 	}
-- 
2.35.3

