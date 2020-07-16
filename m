Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F347F222B11
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 20:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA7F165E;
	Thu, 16 Jul 2020 20:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA7F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594924428;
	bh=x+z8DppY/mKq0GjmNvvlJEDYc/biNP+d5LFvshh5+pA=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GtigLyot1MKIEgnUl/Xgx12HkiD3KjRFzhqjaLxJ0phkzpz3bDz0slKNqJ+kcvzvQ
	 n1HVReDCI74U9RD6dpqkj3AkcQH+uCXQWFWKd2OkBaOHysvRm87RHesj+4i1opn6I+
	 wMthj34Jpjj/tR+zKEVvpL2Inv/uNeqCKt+s13Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86281F80110;
	Thu, 16 Jul 2020 20:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13B2F8016F; Thu, 16 Jul 2020 20:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A451F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 20:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A451F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="OOMXjub3"
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 073415526E
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 20:31:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlgQqNGJv51V for <alsa-devel@alsa-project.org>;
 Thu, 16 Jul 2020 20:31:51 +0200 (CEST)
To: alsa-devel@alsa-project.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1594924310; bh=ObMz0kCe/boQ0i1atLV5epUq3UlUovn6EekbrW1J794=;
 h=To:From:Subject:Date;
 b=OOMXjub3AccwszDZ2OR26fkzkD3XnY1FJoYC4DU5xTEdzcw8tSlMkLo2EhMtuWfsG
 PKUao+aiAqU6VEMkRhcnc/OGWRY1OLwgBE8tZBwaCqvGhE9homHBnS5Zs0bhvps0Er
 iNxRRf8Esc/TvJ5LX1AZYNVmz/qH5iyymJWo4vSNyqKBg1BoHSEyVWZ0JGzDxKam1i
 lzhlKtgAfbcHUkltBdxhTrap5m5B6qXm8Hv+LBrdsf5hQH0u/1r6tLM5MiVjbIG++y
 OLGHUEoEgbuSsSMhY+SsS/LFAm0SII4xoUxNVna5GDj4jji/uTqaX5gnBwyvjQiDIG
 as03vXDZxYBzA==
From: Ujjwal Sharma <ryzokuken@disroot.org>
Subject: Headset microphone not detected
Autocrypt: addr=ryzokuken@disroot.org; keydata=
 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
Message-ID: <a118fbc5-e9b3-54cc-32f9-217e4077b4b2@disroot.org>
Date: Fri, 17 Jul 2020 00:01:27 +0530
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iXaHnEauPMhoALZjFk2U66iNwQJ16jCQN"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iXaHnEauPMhoALZjFk2U66iNwQJ16jCQN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi everyone!

I am unable to get my headset microphone to work, and that's really
puzzling to me since the headphone speakers show up as plugged and work
perfectly (pulseaudio shows the headset microphone as unplugged).

I reported this issue to the SOF issue tracker on GitHub and they
pointed out that it's an ALSA issue. Here's the mentioned thread:
https://github.com/thesofproject/sof/issues/3164.

My alsa_info.sh: https://pastebin.com/raw/K99520LA

Some snippets from there that might be interesting:

[ 7612.883978] snd_hda_codec_realtek ehdaudio0D0: didn't find PCM for
DAI Digital Codec DAI
[ 7612.883986] snd_hda_codec_realtek ehdaudio0D0: ASoC: can't open DAI
Digital Codec DAI: -22
[ 7612.883992] snd_hda_codec_realtek ehdaudio0D0: didn't find PCM for
DAI Digital Codec DAI
[ 7612.883998]  Digital Playback and Capture: ASoC: BE open failed -22
[ 7612.884002]  HDA Digital: ASoC: failed to start some BEs -22

state.sofhdadsp {
=2E...
		name 'Headset Jack'
		value false
=2E..
		name 'Mic Jack'
		value false

I cannot possibly understand what's wrong. Is it a bug in the codecs?

Thanks,
Ujjwal


--iXaHnEauPMhoALZjFk2U66iNwQJ16jCQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETFwj4deUvrj6HOgL/+fdopNzeGQFAl8QnRIACgkQ/+fdopNz
eGTYTw//W9tcMkA3rWST/DyFdeIa/cT2oqO/YS5Yz6QgQgZHvLsNCBHgbusT0UBb
nYmXQ0l49PH/4az2UcVWCL92sfTjvu5BNOKCPbpdrCI/IKUeZ5L6OlWkEAHpxBvr
U0rEwIRMpdoqfsO3ADU9ynx0/AcrNVUVtwU6HTBSx/0pnu5D9iV8DLfOWuSjcIpJ
ACLGcNreW3GXBCJ23c6IGAq0VefcSAVtCbcqU702gwbaSSaqQgGNbJeuzrq6bfWd
4s54yUqNpWp7GiQm2BLYpcUExWd0e9ML7T+QmwNgxIxbFdUcJ5GlvVlPFKcdS6cz
HOw3l7z0R7kUAa0Uocx5+JCnWxsCNPPOX5iLLjTin6LcrqdRzyfnQpN+ELasY/i2
o2clYYJqt0IpcBoF9fT2S2YQT462fyzoLUPC7vSM/VNY6U1hsjYAa+VBtzCY8uUT
HHo/0smdCQG8HTDB/w0DU0dKHN2HARWIokJ1M0Z7muSyfu8YfleNlgsNJqvpJ9S7
5Adx63LBwViNdgK1GpVWHABKdWNkPAxLJA/uhHGn5N2Akc1KzZ+XtU76xTyltt6k
6xT0pjvAmOCinzmX/pRYPOnjEZmLrXDWHii8Mqdj5Tsaa4gyGxter/cqQzJYqiBU
ZoWYWL+pCgKwD2ETHn3+ePrs8s5FjhC4sJyrwhPtXZX+IrmS9O4=
=pwFC
-----END PGP SIGNATURE-----

--iXaHnEauPMhoALZjFk2U66iNwQJ16jCQN--
