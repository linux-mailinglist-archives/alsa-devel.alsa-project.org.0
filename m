Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9467D7E648F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 08:42:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B66F210;
	Thu,  9 Nov 2023 08:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B66F210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699515761;
	bh=+snO3mI/ZLxIUIe7aWkHTOAUfHxW6GlLNJsiIhxyqSk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fM3sK0lmiGX8tCcUwK/EikWthHsn/uVdo0fV6HlIopvi345Dssy7k3uCDZjbRXQfm
	 dSf7gLWyi77FFo+5R3t3mJGUeG4MjAqq1OVgA7lZOxIWRDi3yol29UIBeekQWvqHx2
	 z/7NJNF+TSvcbnuoroZKLF93BU3Npantd8NW9w08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5418F80166; Thu,  9 Nov 2023 08:41:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 902E5F80166;
	Thu,  9 Nov 2023 08:41:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5739F80169; Thu,  9 Nov 2023 08:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5094AF80125
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 08:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5094AF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HuGwlq22;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lRv6wMKv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 788CC21984;
	Thu,  9 Nov 2023 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699515601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dTSlwQpCOB+u4tOhqmFHzGfLOGQH1harYrmMv3/vG0w=;
	b=HuGwlq22HCv5p3LlwSGxcWC7ibwOpgatK/TlpslC9KpE2rL4glJo273j8Gm3IfNp/IdvAy
	hfy6JATMrdtYDOGgQNk7b8cYYv8a2WvJTsrL+h4g6LstLadYiDdvs6FNjqHSkLdZhEtExX
	m7Nc8INX05fNEaOUxSa3RJg1B+oNLoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699515601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dTSlwQpCOB+u4tOhqmFHzGfLOGQH1harYrmMv3/vG0w=;
	b=lRv6wMKvQO/LRkznvgYD1FpvNZfxmGXRtZDR3Qcjdj4/q80o3wRXBvDoQ31yvhji3NVvRv
	ikAsws7ydo4MQPDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 537DD138E5;
	Thu,  9 Nov 2023 07:40:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UrRiE9GMTGWeHQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 09 Nov 2023 07:40:01 +0000
Date: Thu, 09 Nov 2023 08:40:00 +0100
Message-ID: <87sf5fpe7j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "vitaly.torshyn@gmail.com" <vitaly.torshyn@gmail.com>
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/1] ALSA: HDA: Asus UM5302LA: Added quirks for
 cs35L41/10431A83 on i2c bus
In-Reply-To: 
 <CAHiQ-bDGx89vWjtqrnH4FtO-JF9XUWMgwCpR4nusC9Zvw=bN7Q@mail.gmail.com>
References: 
 <CAHiQ-bDGx89vWjtqrnH4FtO-JF9XUWMgwCpR4nusC9Zvw=bN7Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JMQPB2I4TDDKZCMFUTC3DLKZYTWJW2QF
X-Message-ID-Hash: JMQPB2I4TDDKZCMFUTC3DLKZYTWJW2QF
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMQPB2I4TDDKZCMFUTC3DLKZYTWJW2QF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Nov 2023 01:22:57 +0100,
vitaly.torshyn@gmail.com wrote:
> 
> 
> Hi Takashi,
> 
> Proposed patch fixes initialization of CSC3551 on the UM5302LA laptop.
> Patching DSDT table is not required since ASUS did added _DSD entry.
> Nothing new introduced but reused work started by Stefan B.
> 
> Currently there is no official firmware available for 10431A83 on cirrus git
> unfortunately.
> For testing used 104317f3 (which is also seems on i2c bus):
> 
> $ cd /lib/firmware/cirrus/ && \
> for fw in $(find ./ -name '*104317f3*'); do newfw=$(echo $fw | sed 's/104317f3
> /10431a83/g'); echo echo "$fw -> $newfw"; ln -s $f $newfw; done
> 
> With the patch applied to 6.6.0 and obviously symlinks to 104317F3 FW,
> speakers works and to my susrprise they sound quite good and loud without
> distortion.
> 
> Probably confirmation from cirrus team is needed on firmware.
> 
> Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>

Thanks for the patch.
The change looks almost fine, but only one thing:

> @@ -9937,6 +9943,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022", ALC289_FIXUP_ASUS_GA401),
>  	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
>  	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
> +	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),

The entry is sorted in PCI SSID order.  Please put at the right
position.


thanks,

Takashi
