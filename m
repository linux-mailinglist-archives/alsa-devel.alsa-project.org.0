Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E494470E2
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Nov 2021 23:15:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B7F883B;
	Sat,  6 Nov 2021 23:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B7F883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636236952;
	bh=9ynZpJId+rrCY0MW27wMpvO2sT8585gxLq/3K98v65o=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bHH2o6+pEZJmFVmzbkmBl90t0Il+15HunZxqkezekiIpoymY13H/frh/hF1QX+YYt
	 yDkKLW9JmvRTyRaYNvOekuQIswijB3IRNHTnZJSFXKG7FGOvbY0LF6cCx9hUcoeFK7
	 SUePewhu9Eo8XkULwacUbBUN28ab4JJFziOmJ4zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C15F8025F;
	Sat,  6 Nov 2021 23:14:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73398F8025D; Sat,  6 Nov 2021 23:14:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from olivedrab.birch.relay.mailchannels.net
 (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C48F1F80169
 for <alsa-devel@alsa-project.org>; Sat,  6 Nov 2021 23:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C48F1F80169
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=thevertigo.com header.i=@thevertigo.com header.b="XHIf63gN"
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 95F90121CB5;
 Sat,  6 Nov 2021 22:14:21 +0000 (UTC)
Received: from pdx1-sub0-mail-a275.central1.pdx1.dh-int.com
 (100-96-17-28.trex.outbound.svc.cluster.local [100.96.17.28])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id F32D4122102;
 Sat,  6 Nov 2021 22:14:20 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|kip@thevertigo.com
Received: from pdx1-sub0-mail-a275.central1.pdx1.dh-int.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.96.17.28 (trex/6.4.3); Sat, 06 Nov 2021 22:14:21 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kip@thevertigo.com
X-MailChannels-Auth-Id: dreamhost
X-Fumbling-Minister: 2b1345065a818b03_1636236861260_263315573
X-MC-Loop-Signature: 1636236861260:3710320450
X-MC-Ingress-Time: 1636236861259
Received: from kip-desktop.kip-router (unknown [192.252.230.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: kip@thevertigo.com)
 by pdx1-sub0-mail-a275.central1.pdx1.dh-int.com (Postfix) with ESMTPSA id
 4Hms9S4LFzz35; Sat,  6 Nov 2021 15:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=thevertigo.com;
 s=thevertigo.com; t=1636236860; bh=i6aDfhdsmj+nveDeSyvyw0NTe9c=;
 h=Subject:From:To:Cc:Date:Content-Type;
 b=XHIf63gNjMP4mgqBuASkB5yx3ft5cJySe73FRedPYoLa00imn+KLKAsf7HClwrtpB
 JXMODRmnI9uE3VOFce4MinxCYE24VhBv7R8deKEZ3GAgpNyxq2Wvdd2LbhJcUjVhLk
 uIBU/+RRKPQ6rJmebGhHP0lFc+R6s7mC5irTeHZI=
Message-ID: <13472b4735a4699a6db56f13c3703f481f8f21a3.camel@thevertigo.com>
Subject: Re: [Alsa-user] USB audio on riscv64
From: Kip Warner <kip@thevertigo.com>
To: chris hermansen <clhermansen@gmail.com>
Date: Sat, 06 Nov 2021 15:14:19 -0700
In-Reply-To: <CACc2_6-e4JCOBc-kE4_i6HNYt6x1xsSd73Hikr9PKn3vYdcxaQ@mail.gmail.com>
References: <f2ec64dab6a74c7eee0625533d3c3630adb62a41.camel@thevertigo.com>
 <CAJZ5D0bnMA=zZPztvQB4h0sXhU2og9D84QH8CXx5-GRWeu+4Ug@mail.gmail.com>
 <e91d7a44b9a456141d856ea57aa2948c3be4422f.camel@thevertigo.com>
 <s5h35oahppb.wl-tiwai@suse.de>
 <3832054fd315605b19bd9d74977f83078a95ee08.camel@thevertigo.com>
 <s5hr1bue8fz.wl-tiwai@suse.de>
 <35c65f0177395968c01ea4b00d52c021cf2f9191.camel@thevertigo.com>
 <s5ho86xeoiy.wl-tiwai@suse.de>
 <07abba7df72f0dd27432a5dcda46f6b24483b78d.camel@thevertigo.com>
 <s5ha6ihdm24.wl-tiwai@suse.de>
 <4cbf9bb8d417414d720560c05bddc9a2714e0975.camel@thevertigo.com>
 <CACc2_6-e4JCOBc-kE4_i6HNYt6x1xsSd73Hikr9PKn3vYdcxaQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-TItqg1boLbYqSMXEbQxs"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Cc: ALSA-User <Alsa-user@lists.sourceforge.net>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Dmitri Seletski <drjoms@gmail.com>
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


--=-TItqg1boLbYqSMXEbQxs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-11-06 at 14:50 -0700, chris hermansen wrote:
> To allow remote users to use ALSA, you need to add those users to the
> audio group, however this is not recommended by default (see note
> below).

Thanks Chris. For anyone else having a similar problem, adding myself
to the audio group, like so, fixed the problem:

   $ sudo usermod -a -G audio kip

--=20
Kip Warner -- Senior Software Engineer
OpenPGP=C2=A0signed/encrypted mail preferred
https://www.thevertigo.com

--=-TItqg1boLbYqSMXEbQxs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEaUi0dj/qpTzsKe4xRLRlxF7U4wQFAmGG/jsACgkQRLRlxF7U
4wSKKhAAzvLMjbwXoBDnfVYUeIe8dftCcCDfqyCBANbz6vf/K25Xx4TUSy4nIS1J
XwiG+KjcE9G9TPp8Y9x/f4dknaAIJ7FyWNGVap6T30VHkBaHypL/XzDLnzsuG1Np
RnEZqk1KXghkgW3d86tfnnPVk0dKAazg/bL2Gdod5xXWhBTAibgFbl142Cn9HdG6
2/3UsYhe54uv/XA0qWviCqAQqE0nh7EAWCWPbAHGufjz4r06VlbnAbruF5flLbUV
erjVolVMsJqzm9Fjx467eUBe7TLlDhsOi8Crm8ykGf52kRyw9KG8CXPqqWWN+Gyk
K866ZGxyJQt6jRgN0ekY+/nsiKycMU2hAcRBa5gC05YyjmHc3QVSJziIv+UYqrR8
hifHRf/fuuQmcFVXKo0OI6kAVMt0X2uh4KvKe8soIPsegVpvr3+vh+nf7wQ88H1X
KGFl6JdfNmArMn6+DCAjDoG+YFskbnNh3LDE0+ykxVq5QvU6KuoOl7e74oBius5a
/mYkNo9ED9BkXSY6UwjNqBmCwjn35H8KHhYd8C5RAod8i1zCxPhRiqtaSOFXgGPR
3wCeV1328r+DwL/2K8KHPXe6/fRl/IDeZ3OtLkDFne31NSXVZ2psWvpDlURiplcW
7iJ9TkyOWwZwlWw8FFnUfIsTZa91+7jBrb8EB3o7tXSL8BWLrJc=
=0csx
-----END PGP SIGNATURE-----

--=-TItqg1boLbYqSMXEbQxs--

