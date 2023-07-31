Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF7769C13
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4D88845;
	Mon, 31 Jul 2023 18:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4D88845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690820165;
	bh=42ovH2TacZhyGC161pLnRaAN1iUW+o5I0IbYxD7gWRU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P7EBzWwQ/59CLS9DE/2MNu0emZ1H98ZtNenhc0IhBbpyRegYPhLXMpVdV4g/rTSo5
	 CC72R/V6CFABkv1vzfuzwGgQY2SaXrgwwTJ4isPQ5p+FLbMHOMKYuZTMuYwX0M9f1E
	 //hbbM+i0alux0Bd6Y+7s81oGsG2q4MD1s5Nyffk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EF70F8053B; Mon, 31 Jul 2023 18:14:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AED80F80163;
	Mon, 31 Jul 2023 18:14:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BE8F8016D; Mon, 31 Jul 2023 18:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CD4BF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CD4BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rUzOmdPz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9H0Vga1S
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D4A81F854;
	Mon, 31 Jul 2023 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690820079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FPdvVJdYdtOHQsKLQpCAb/yeA5uJ3rxVC2Q1LTBHKs=;
	b=rUzOmdPzBoAVPHEFZ8/BZFHzOOB1JhJ4VXdTppltLTFlTY5HBTXyE0iUWfZd4ZX9O2CCwi
	wjczEqRgYsHZmX833c1GvprLht48uk0lZ3tbMReVKsL7tdm2E7brjVQpShSs7xIBX0qUaY
	CUDQE8Ry5k1hFWImGj+9FrnbXmm0fdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690820079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FPdvVJdYdtOHQsKLQpCAb/yeA5uJ3rxVC2Q1LTBHKs=;
	b=9H0Vga1SoaCmt4UMa04L5AHwlWfZtjWyWkK06GmWA9QGpF1LqT/vXNom/YzSkfSNZ9LI4c
	pHfjzn6qVrk0AaCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DD6A1322C;
	Mon, 31 Jul 2023 16:14:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tNCCAu/dx2S7DQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 16:14:39 +0000
Date: Mon, 31 Jul 2023 18:14:38 +0200
Message-ID: <87o7jshxch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "Joseph C. Sible" <josephcsible@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <878rbjdofa.wl-tiwai@suse.de>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>
	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
	<87fs7mdofi.wl-tiwai@suse.de>
	<7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
	<87353kd8b9.wl-tiwai@suse.de>
	<1170325957764b4cbd7cd3639575f285@realtek.com>
	<CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
	<873536js7q.wl-tiwai@suse.de>
	<CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
	<2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
	<CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
	<485f99149508488080d563144454040e@realtek.com>
	<CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
	<2831c55638a5431ca9e37d9caf365ed2@realtek.com>
	<CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
	<3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
	<CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
	<009474f04d0b45c69a0e42e8622b7a86@realtek.com>
	<87h6rhcef2.wl-tiwai@suse.de>
	<0990300d759846d890de9c92fcad9a9d@realtek.com>
	<CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
	<878rctcavz.wl-tiwai@suse.de>
	<874jnhc9u4.wl-tiwai@suse.de>
	<CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
	<875y7vbxpg.wl-tiwai@suse.de>
	<CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
	<87wn0aa1s4.wl-tiwai@suse.de>
	<CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
	<87leg7x4h7.wl-tiwai@suse.de>
	<f4969213b5a14cc5a11befb4df861481@realtek.com>
	<87cz182hfk.wl-tiwai@suse.de>
	<4678992299664babac4403d9978e7ba7@realtek.com>
	<CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
	<1f83caa215ad4374aec8859c70044b00@realtek.com>
	<878rbjdofa.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OIELAMTYKELEA7EHYEDNZSJLPC24HBXG
X-Message-ID-Hash: OIELAMTYKELEA7EHYEDNZSJLPC24HBXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIELAMTYKELEA7EHYEDNZSJLPC24HBXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Jul 2023 07:58:49 +0200,
Takashi Iwai wrote:
> 
> On Fri, 14 Jul 2023 04:46:25 +0200,
> Kailang wrote:
> > 
> > Hi Takashi,
> > 
> > Could you agree this workaround?
> 
> Yes, looks fine.  I applied it now.

... and now we receive a regression report due to this change :-<
  https://bugzilla.kernel.org/show_bug.cgi?id=217732

I believe the problem is that the patch disabled the 3kpull-low
behavior too much while some codecs still need it.

The patch changes like:

@@ -3638,8 +3640,7 @@ static void alc256_shutup(struct hda_codec *codec)
        /* If disable 3k pulldown control for alc257, the Mic detection will not work correctly
         * when booting with headset plugged. So skip setting it for the codec alc257
         */
-       if (codec->core.vendor_id != 0x10ec0236 &&
-           codec->core.vendor_id != 0x10ec0257)
+       if (spec->en_3kpull_low)
                alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
 
        if (!spec->no_shutup_pins)

... while the only place setting spec->en_3kpull_low is:

@@ -10682,6 +10683,8 @@ static int patch_alc269(struct hda_codec *codec)
                spec->shutup = alc256_shutup;
                spec->init_hook = alc256_init;
                spec->gen.mixer_nid = 0; /* ALC256 does not have any loopback mixer path */
+               if (codec->bus->pci->vendor == PCI_VENDOR_ID_AMD)
+                       spec->en_3kpull_low = true;
                break;
        case 0x10ec0257:
                spec->codec_variant = ALC269_TYPE_ALC257;

Since spec->3n_3kpull_low is false as default, it means that, except
for ALC230/236/256 and PCI vendor AMD, the flag is never set, hence
it's no longer called.

Shouldn't spec->en_3kpull_low be enabled rather as default?  Or which
models can set it?


thanks,

Takashi
