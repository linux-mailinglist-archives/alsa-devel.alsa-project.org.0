Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8A4A7178
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 14:23:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D3E1204;
	Wed,  2 Feb 2022 14:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D3E1204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643808216;
	bh=EIsy59d1uU8qIkHRTPbxWJ+X7di+dVj1ejfu0IGcmgI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaPttVHlM63OzXY/I54a0dqwYZUIltCBfryJ5eVAff8S/yxQFzKNfibN65noNhLyy
	 g4HIM7fz+3hVV44CdfwQY36DZKL8SB7aIFwDYoc1OUWYL20E8XEM8vQtU/SpY2X+c9
	 A94qJCHmgQ9SLVuHGyolAzYUNO9B4bj3k1ND9p74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC7A5F804B1;
	Wed,  2 Feb 2022 14:22:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC5EBF804B0; Wed,  2 Feb 2022 14:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5758EF80095
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 14:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5758EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XDGq5Tr5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09D0C61781;
 Wed,  2 Feb 2022 13:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDB0C004E1;
 Wed,  2 Feb 2022 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643808140;
 bh=EIsy59d1uU8qIkHRTPbxWJ+X7di+dVj1ejfu0IGcmgI=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=XDGq5Tr5MAq0a0JKJvcH5Zn8sH8Xqw2qOa92N0tggelBYIw/M8SPycusVy5/Mk/sL
 wviU45rkpSyTSeRiGryd4ZnUxsAeJmLmtpQ3r7X5B9WAnuUQDwNYghS4XMWBjbMvnM
 CCBaNy7Vf6Nd8CgKpqMlc+Dnc1GlZdNflivxi2T1VD86btEjglnxffLX+bjcFVHwwf
 ZtUaap+jr7CiMnzintfCj577vX754KnmUiNjT40LjBjUZhzTTq4zmOOGIj7YGdl9YH
 cIJnqSKX4rYGQb15nbwnOV6b7OA3VaJcvYT0odZIt7L6m2noqyCsVAyRw7b6alE7mH
 sLAzJn2lI+ceg==
Date: Wed, 2 Feb 2022 13:22:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest: alsa: Check for event generation when we
 write to controls
Message-ID: <YfqFiIHaPnvY1+W7@sirena.org.uk>
References: <20220201151551.21497-1-broonie@kernel.org>
 <YfnksdOR5HR0mZi0@workstation>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HgO9RPne0YIh77zU"
Content-Disposition: inline
In-Reply-To: <YfnksdOR5HR0mZi0@workstation>
X-Cookie: Quack!
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


--HgO9RPne0YIh77zU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 02, 2022 at 10:56:01AM +0900, Takashi Sakamoto wrote:
> On Tue, Feb 01, 2022 at 03:15:51PM +0000, Mark Brown wrote:

> > +		/* The ID returned from the event is 1 less than numid */
> > +		mask = snd_ctl_event_elem_get_mask(event);
> > +		ev_id = snd_ctl_event_elem_get_numid(event);
> > +		if (ev_id != ctl->elem + 1) {

> As long as I know, the design of ALSA control core just exposes the
> numeric identification of a control element issued for notification in
> 'snd_ctl_event' structure. On the other hand, the above evaluation
> expects decremented value against position of queried list structure
> has come.

> I note that current design of ALSA control core is:
>  * 1 is selected for numeric identification of the first element in the
>    first element set added to sound card.
>  * at removal of element set, the series of assigned numeric identification
>    becomes blank (coded as hole).
>  * Userspace application can always add/remove element set to the card.
>  * the position of element in queried list structure does not
>    necessarily corresponds to numeric identification even if decremented
>    by 1 due to the hole.

Oh, I see - we have multiple IDs here which is what's confusing things.
This looked wrong when I was writing it and I was hoping someone would
confirm what was going on on review so thanks.

--HgO9RPne0YIh77zU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH6hYcACgkQJNaLcl1U
h9Aq9QgAg3UsfWD5fQB5Vf3Si8tYogGNaaVLUNospDpGtveAPqrO+DNnoaS+w/QF
yvoWYUXMzUeaK8TrRgawE3euuxl3BCIDJgnU6PkIVuYYNgrBTo94KAGYku+p5D6X
1/fHCC9wrc5Wpvkh8y23KdKbYecs8QglpZBjsJlTvglsAkpdz/Ss5eVLdYbcvzau
Yb+UcmTg1ajTII6UvVCMM05iSfYCNLdWvCGBrW+rnPumoqs0xblAqfp4txBRjTdv
//viPLYzcxT3rv2pGp8NaUHFRf844UsKuLJ55dj1m6S4oAKiLjz0obTBRbgDlXU+
7WYgz1XxhejKbH8JP12MYMb/7so1FQ==
=3AVw
-----END PGP SIGNATURE-----

--HgO9RPne0YIh77zU--
