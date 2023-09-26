Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707167AEDB3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77BEAA4B;
	Tue, 26 Sep 2023 15:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77BEAA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695733715;
	bh=fsWwDoEOK4hAw1RCGaHeyr9yqhL0IEyrUhbGj+7/iI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mLRulQUu0qUCwtAQe5DqqycbvQfs0wyXM904MdTf2F27L9cTw6JysD3GTJTAwqWvV
	 Wp6t8J7JbaIJnfP0HZ6Q5Z+wPY+7NoZFwWqZcx55g/hneNsFgz2bQyanDtMvheVL+E
	 AN3Ist0whZBvYvnxOPpMQtVNbWVVs1Zmrr64GHO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77B63F8047D; Tue, 26 Sep 2023 15:07:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BCEF8016A;
	Tue, 26 Sep 2023 15:07:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65130F8016A; Tue, 26 Sep 2023 15:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 588A9F8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 588A9F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FTfNnfw0
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-69101022969so7728056b3a.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695733287; x=1696338087;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fsWwDoEOK4hAw1RCGaHeyr9yqhL0IEyrUhbGj+7/iI8=;
        b=FTfNnfw0iBlC95cpvWznvY4cPsRN4DlWKuwrMljh494bLAUfbLv6/ebo+Utw9MWSfM
         Q3u1Wk4BRTQwxtUqlYV9iBfYLxArFFI3NmBfHXSEy6Oh90Du0cvGelAYg809pQdd7i+I
         YrjXsnF0rxeUp7Z0Dok5UeRd27Pf69lFverdz4gkl2ml6ZUSRXAFhY/aMtkhMm5emQnU
         xO7EOb+AjHXxc8bGtjQ6T2sPvIYfXkUVhWi060eVop9nFI2RQebTX2XTILJqcikf0B4K
         /CcGEQMVZnOUAYUCMpdDHgBb9IJ3sJiDjPQbKB/3B+kNuaoT+yLsPrSTd2/sFoGO8aI/
         L0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695733287; x=1696338087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsWwDoEOK4hAw1RCGaHeyr9yqhL0IEyrUhbGj+7/iI8=;
        b=AmeVdgnSAnd6WxB6l26yOMf+8Ql+G70oy7Y6q3iPQBD0GKOfW68gFSfwjoj9uA6Ftw
         0609oQ6ueDnVd3rPGaVsUGOEjFSMFDHSKToRfGi1maDSH63gX405/a4K5iOBHQhwk7Lg
         npz+vZIhKblDOkEo3MXMt/ZaWytyBPQFU86JtPVeF6RFG5ciYRqCKfFWCa/YnHOJdnJz
         9CrzsJFFGdK2NxyjPuNvXk+eC4oyEyaP4IjPWBpJY98jgNxBMYgowVC4lfKKdJHsc4dF
         WYFtC+l+HWeLdZGe7gtJj1FakBf3FG2q4vKyqbVvYlxvRxxMUYnD7lVKCsBE0ZCBKqMY
         hH0w==
X-Gm-Message-State: AOJu0YwqgSLIA5Pgy0/K6kHHPRP4sjmZrM0hClvuShRKLP0K72HaJCLM
	dALBK1IXOutLfyXCWoAHt9JPRMhZawTqrQ==
X-Google-Smtp-Source: 
 AGHT+IFpAKKyu0e5+QquYPdBacUCd2WglwVBN4louTG5oQHFc8+OqA9ejkNsqnf1tEHH0SvfP3nRDA==
X-Received: by 2002:a05:6a20:9756:b0:154:d3ac:2050 with SMTP id
 hs22-20020a056a20975600b00154d3ac2050mr9527275pzc.33.1695733287195;
        Tue, 26 Sep 2023 06:01:27 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id
 m13-20020aa7900d000000b006877a2e6285sm9855981pfo.128.2023.09.26.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:01:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id E8EFE8206CE1; Tue, 26 Sep 2023 20:01:22 +0700 (WIB)
Date: Tue, 26 Sep 2023 20:01:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sid Boyce <sboyce@blueyonder.co.uk>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ALSA <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: Ryzen 9 7950x sound module does not not build
Message-ID: <ZRLWIkyngsasQbQ7@debian.me>
References: <213f93b5-bffe-479f-a111-f8a7e44cd293@blueyonder.co.uk>
 <61821f15-78e2-4594-8f39-545ecaa97000@infradead.org>
 <5903832d-7d27-4847-b161-48b9f7e92ee6@blueyonder.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FrAjWSJL6KxdySBL"
Content-Disposition: inline
In-Reply-To: <5903832d-7d27-4847-b161-48b9f7e92ee6@blueyonder.co.uk>
Message-ID-Hash: 64FY4SEYDECP3EIZKMZ6OST5FS55NBVA
X-Message-ID-Hash: 64FY4SEYDECP3EIZKMZ6OST5FS55NBVA
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64FY4SEYDECP3EIZKMZ6OST5FS55NBVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FrAjWSJL6KxdySBL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc'ing alsa ML and related maintainers]

On Tue, Sep 26, 2023 at 01:23:13PM +0100, Sid Boyce wrote:
> I've since rebooted and did a modprobe. No idea why it isn't automatically
> loaded.
>=20
> #modinfo snd-rpl-pci-acp6x
> filename: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/usr/lib/modules/6.6.0-rc3-=
vanilla/kernel/sound/soc/amd/rpl/snd-rpl-pci-acp6x.ko.gz
> license: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GPL v2
> description: =C2=A0=C2=A0=C2=A0AMD ACP RPL PCI driver
> srcversion: =C2=A0=C2=A0=C2=A0=C2=A00F909BC61165681426ECEEB
> alias: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pci:v0000102=
2d000015E2sv*sd*bc04sc80i00*
> depends:
> retpoline: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Y
> intree: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Y
> name: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0snd_rpl=
_pci_acp6x
> vermagic: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A06.6.0-rc3-vanilla SMP preem=
pt mod_unload modversions
>=20
> # modprobe snd-rpl-pci-acp6x
>=20
> #lsmod|grep snd
> snd_rpl_pci_acp6x =C2=A0=C2=A0=C2=A0=C2=A0=C2=A016384 =C2=A00
> snd_seq_dummy =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A012288=
 =C2=A00
> snd_hrtimer =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A012288 =C2=A01
> snd_seq =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0131072 =C2=A07 snd_seq_dummy
> snd_hda_codec_realtek =C2=A0=C2=A0192512 =C2=A01
> snd_hda_codec_hdmi =C2=A0=C2=A0=C2=A0=C2=A094208 =C2=A01
> snd_hda_codec_generic =C2=A0=C2=A0110592 =C2=A01 snd_hda_codec_realtek
> snd_hda_intel =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A065536=
 =C2=A02
> snd_usb_audio =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0458752 =C2=
=A02
> snd_intel_dspcfg =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A040960 =C2=A01 snd_hd=
a_intel
> snd_intel_sdw_acpi =C2=A0=C2=A0=C2=A0=C2=A016384 =C2=A01 snd_intel_dspcfg
> snd_hda_codec =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0233472 =C2=
=A04
> snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_real=
tek
>=20
> snd_usbmidi_lib =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A049152 =C2=A01 s=
nd_usb_audio
> snd_hda_core =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0147456=
 =C2=A05 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_cod=
ec,snd_hda_codec_realtek
>=20
> snd_ump =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A036864 =C2=A01 snd_usb_audio
> snd_rawmidi =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A057344 =C2=A02 snd_usbmidi_lib,snd_ump
> snd_seq_device =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A016384 =C2=
=A03 snd_seq,snd_ump,snd_rawmidi
> mc =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A094208 =C2=A01 snd_usb_au=
dio
> snd_hwdep =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A020480 =C2=A02 snd_usb_audio,snd_hda_codec
> snd_pcm =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0225280 =C2=A06
> snd_hda_codec_hdmi,snd_hda_intel,snd_usb_audio,snd_hda_codec,snd_hda_core
> snd_timer =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A053248 =C2=A03 snd_seq,snd_hrtimer,snd_pcm
> ledtrig_audio =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A012288=
 =C2=A02 snd_hda_codec_generic,asus_wmi
> snd=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0163840 =C2=A023 snd_hda_codec_generi=
c,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_usb=
_audio,snd_usbmidi_lib,snd_hda_codec,snd_hda_codec_realtek,snd_timer,snd_um=
p,snd_pcm,snd_rawmidi
>=20
> soundcore =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A016384 =C2=A01 snd
> usbcore =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0446464 =C2=A06
> xhci_hcd,snd_usb_audio,usbhid,snd_usbmidi_lib,btusb,xhci_pci
>=20

Any errors on dmesg when loading snd-rpl-pci-acp6x module?

--=20
An old man doll... just what I always wanted! - Clara

--FrAjWSJL6KxdySBL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRLWHQAKCRD2uYlJVVFO
o+KxAP9FbaZ3F2Bulu1dy6/JGeNXATu+DFHlrFdov0TfHgMdxAEArv3dpUxz26KP
MJ/Z3kC+XMbYJAmkuv7jPFgaOxPOyAE=
=jqov
-----END PGP SIGNATURE-----

--FrAjWSJL6KxdySBL--
