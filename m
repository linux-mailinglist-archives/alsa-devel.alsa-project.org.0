Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2891D511
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 02:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6102342;
	Mon,  1 Jul 2024 02:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6102342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719792976;
	bh=+MxkO4vVdthV7j6mFV/7SPcQj12oitKeXtcQAI267PY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZC1UXCFHg0T1DqgWOmqY1r54+Q7biesFXoPpSxP1dEMO3KpAZK7rrPX9S4JSotH6g
	 SfSHxEdb5J7+hxyDX4JabH4npZ0+5BVCklMZGyesutvUiQCENP2PtB3XkWgfHrg/Si
	 or3vVOYtst8Uu35+BXdGFny7v1adk9kgvpjQ/9fg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44B78F8028B; Mon,  1 Jul 2024 02:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C935F805AE;
	Mon,  1 Jul 2024 02:15:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 637E8F8028B; Mon,  1 Jul 2024 02:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42B64F8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 02:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B64F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=grVIlFxS;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Pn6icnKi
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 052AF1380256;
	Sun, 30 Jun 2024 20:07:16 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sun, 30 Jun 2024 20:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1719792436; x=
	1719878836; bh=+MxkO4vVdthV7j6mFV/7SPcQj12oitKeXtcQAI267PY=; b=g
	rVIlFxS4PQCQ4iOMByp7mvKQIK6SvLZr8FbJ5WtIRdcI89pnLbBgpkedStEkcXNs
	2+v08hMklAt1PfQMBuwiY5dhFdNA3eXOcixSXM/2OjdceMT5b3Eqy8Efsju+hMb3
	VnJFY5SaGONlORw5xUgFoCOHYeSbLCLUi/PG55B9f5ErF0O2qc7dREkUrowgtWEN
	Oe2OsgzmsQDHjkAPh1CY6r1FmDIOxFsnePftaiRctrZbWCpnU4wVPSJ6FyDzE+qL
	nb3D7BQkY9oZXQ7E8+vvADAIZJykpn+hg2GPksO5XcQdrwQY61iBFekQlndRZiOr
	gXjjJYkyoAjlxcx1BzrBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719792436; x=1719878836; bh=+MxkO4vVdthV7j6mFV/7SPcQj12o
	itKeXtcQAI267PY=; b=Pn6icnKiVdJp+jnc+p1CA6TQ9yGKYIL/vrzCiHevEk2I
	7NxQk2GW9LDfZLAEHCZHeciWNUdJJ28Tfvp4meIAv1td2mZc9wL7j0ii9jEp7a3S
	LSCNTZy/Fxm31+FPOH6FTYHFDSw6OaCsncaPeyFYyfagqAg5somO8NZtRfhkRxib
	BRrr3Jkl5sq1T6lkljMGaoHlR+mgXfFoUGFF7mbOIzpHeioy9RU6xiJe7MnIozt7
	TiB88F71FSxsx4hn8Tad8VJTp+bi9076FHhzoXBDT86YixvzCQI2qIKKrCstr+w5
	PB8CREZQTAoK79kOv2kcg8oEB8njtWbn6/giaAW/Vg==
X-ME-Sender: <xms:MvOBZl9TA9fomzzsplZyl57RB8u_dcle9C0PGYAjauLXWJYakFiLGA>
    <xme:MvOBZpv12w6TM1VB3y_McIA5x2SuEg-Vs7Gka8eKlZFURWUvpd1beuFu5wZsJ6_IG
    Djo7s3AidrQEgd05rA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddruddvgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfvrghk
    rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
    hirdhjpheqnecuggftrfgrthhtvghrnheptdfhvefhtdehleffvdetteffieelfedttefg
    keeuleetfeevjefhgeevffffudfhnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:MvOBZjAtlb7vd5sKnTrde27poRqOQf9q-8wAFsp1Y92uujOaiL1hgA>
    <xmx:MvOBZpfJQLmgk-mfcB4X1ebx0gfa0tPuM52jkt_PUk9XzyimqBDKZw>
    <xmx:MvOBZqNDKxsUXXlC7_0WpyptxTocfsRnh-nA6J0GwUrOs3Bzve53OQ>
    <xmx:MvOBZrnaWqUtMbKF-7858Hi3w9HtsKsWL9SYyzaQExue18mnLGPoQQ>
    <xmx:M_OBZnoVx-ndTbERbN-xEh3UdR7xwxZjsiNkGlY6sdb52m0r_R25l_db>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 99CAA36A0074; Sun, 30 Jun 2024 20:07:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <e0ed11c2-a4bf-40ec-95ad-fa61d95987c7@app.fastmail.com>
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Date: Mon, 01 Jul 2024 09:06:43 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Asahi Lina" <lina@asahilina.net>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Cc: "Takashi Iwai" <tiwai@suse.com>, "Jaroslav Kysela" <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Content-Type: text/plain
Message-ID-Hash: OS4TR6S6D4UAX2FOE7J2YJIDPSC3LKGI
X-Message-ID-Hash: OS4TR6S6D4UAX2FOE7J2YJIDPSC3LKGI
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OS4TR6S6D4UAX2FOE7J2YJIDPSC3LKGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I'm a maintainer of both ALSA firewire stack and Linux firewire subsystem. As
long as I know, there is neither consensus nor specific userspace API/structure
to the issue , therefore each developer selects each way within current
implementation of ALSA control core and userspace interface.

On Mon, Jul 1, 2024, at 01:04, Asahi Lina wrote:
> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.
>
> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.
>
> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace? I think for something like this you pretty much
> have to rely on device-specific tools to make the UX manageable, so
> maybe hwdep... but at least exposing everything as an ALSA control would
> have the advantage of supporting save/restore with something like
> alsactl. So I don't really know what's the way to go here.

In my opinion, expose of such many control elements would not be necessarily
convenient to users, especially to who eager to use GUI for such matrix mixer.
Additionally, initialization for all of configurable elements in device would sometimes
require conditional operation somehow (e.g. dependency on sampling rate or
any mode of digital interfaces).

If you have no need to share one of the USB endpoints for any configurable
elemenets between kernel/userspace, it is a simple way to implement such
confuguration application as userspace application, as you did with Python 3 and
libusb.

Anyway, if you eager to change ALSA control core and its interface to userspace
for the purpose, we go for more discussion about it. We share the same interest.


P.S. for devices supported by drivers in ALSA firewire stack, I write some service
programs in userspace to utilize ALSA control "user-defined control element set".
You can find the implementation of protocol to configure RME Fireface
400/800/UCX/808 in it, as well as any DICE-based models:

* https://github.com/alsa-project/snd-firewire-ctl-services/


Regards

Takashi Sakamoto
