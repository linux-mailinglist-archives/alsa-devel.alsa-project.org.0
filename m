Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7842F8D2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:53:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C3F9186C;
	Fri, 15 Oct 2021 18:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C3F9186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634316779;
	bh=+YAhqqeg31opM/FErwfeSfZchusHTV/GnvHk3C8Fg2w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvNhfV4pr15rjrKfmqsF7w4WIxVrUG8o6x3NCS28YC+ID5KNNe+66OohYiJei22kd
	 0fGA9NKixWIzNKcjjSVryJpGu/sdyacnxKgW6o+HM1gKXT+KLqfZwDTf0E3WbFNr+Q
	 rhkKO60BKwYWVHuUOzFTOqyppy8cWu8qZxkiWhRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71244F80430;
	Fri, 15 Oct 2021 18:51:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1834F80423; Fri, 15 Oct 2021 18:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42002F80269
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42002F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UFAVa8q6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC8C5610E5;
 Fri, 15 Oct 2021 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634316699;
 bh=+YAhqqeg31opM/FErwfeSfZchusHTV/GnvHk3C8Fg2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UFAVa8q6kq5NnsKviR1mANImu7ygaf7VRXTJJ7LiNVEY3z7OB4HTOUIz309aRLWvs
 IH6UU7vlhuMuGAz2CMbqTDLGf5r9g8v7t5eeN+Gyv88f7lj4ARPuaNoOHIDEIdiy6y
 NttS3hSfveC4q317TDkoQ4/7HiZk3dzolpMUYrBZkf1OHMJY9bXRnVfY2VTHu1gdP/
 ycVfmYldvUN+lzZ5d7C9CuM2fOBKrYLzuAlze5bDlHxP9cZJee7iosTQjm7ugdPDc1
 SN+o3uB6aHzkRqE+fsYRiTo2Xxmqve2BODIXiq0iL5fwg4Ykx69vG0hiMyIh4XtBNs
 rWM6CSh3utxow==
Date: Fri, 15 Oct 2021 17:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: George Song <george.song@maximintegrated.com>
Subject: Re: [v2 2/2] ASoC: max98520: modified alignment and blank
Message-ID: <YWmxmBh7J1x2SaXi@sirena.org.uk>
References: <20211015072709.3167-1-george.song@maximintegrated.com>
 <20211015072709.3167-2-george.song@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c6F6S5RFH6FoFZXx"
Content-Disposition: inline
In-Reply-To: <20211015072709.3167-2-george.song@maximintegrated.com>
X-Cookie: 1: No code table for op: ++post
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org
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


--c6F6S5RFH6FoFZXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 04:27:09PM +0900, George Song wrote:
> fixed all CHECK and WARNING for checkpatch --strict result
> removed MODULE_AUTHOR to make one maintainer.
>=20
> Signed-off-by: George Song <george.song@maximintegrated.com>
> ---
>  sound/soc/codecs/Kconfig    |   7 +++
>  sound/soc/codecs/max98520.c | 121 +++++++++++++++++-------------------
>  2 files changed, 64 insertions(+), 64 deletions(-)

Looks like the same issue here - squash the fixes into your original
patch and then resend that as your version 2.

--c6F6S5RFH6FoFZXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFpsZcACgkQJNaLcl1U
h9BxhAf/ZP7AuNZwTFb2d6XyaWTWhMHambCrYCcXRNyDiOYGeSxvatyPzp29PjPb
jqWT+gpcKI76X6j5Yl+viwb4nn7Udlp52Pj7bGnc2vT+pegPv4dqUAs5ulKnHmO+
oeJQC9IK1mpLhJ+unt0WhzjZ7n6VT71yVVVeSfulyj5MB0/tflzkg6NPfxxHJYgH
NwvgIHMOfX0mUdQrHA9Tsyu1kmkPnbVgNcaiU4kNtVoFKiOzc5fkZJgqhe5o9kkU
q/cFRdalfv9HqYhpxNAmIU7G/Nnm23HKEsfcYsW3YEudVTbfODpsD9EYhgre/trF
IiwgiTPGI0txoXEWtbSWr6w0tBDyqw==
=dZtG
-----END PGP SIGNATURE-----

--c6F6S5RFH6FoFZXx--
