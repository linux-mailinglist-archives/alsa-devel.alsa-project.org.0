Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C856407A4
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 14:23:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADB8017F6;
	Fri,  2 Dec 2022 14:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADB8017F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669987426;
	bh=0LVuCvHK90xP67xYqSpII4+HmPxMJIOXna0dwxxgfyM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AvbUmkhieKiRge+5F32wDeyVbZoR4qsA543xRmv3qLWlrTpd1jGya0ZGM4UIDZcGR
	 wpeBZ5KZNmOLBGzE6C/3qvJHJrYIL2LAP5NFe1+G2Qqk0VHEVRa5Lj837SZJf79BK8
	 3d2i23Ev6GoJ8C5HmuHbJ08pzRXvNXmXD+6MUTyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E3EF804B3;
	Fri,  2 Dec 2022 14:22:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 666FDF80310; Fri,  2 Dec 2022 14:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 094F1F800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 14:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 094F1F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L4IQdxsL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C15ACB8216A;
 Fri,  2 Dec 2022 13:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAF4C433D6;
 Fri,  2 Dec 2022 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669987364;
 bh=0LVuCvHK90xP67xYqSpII4+HmPxMJIOXna0dwxxgfyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L4IQdxsLaBziQ0H6zXCxqx+hefbkj855E6zaz0wZLrKu9MbRZwf4Vbfz+QIMpm497
 UqDZyLAo8tffBVvlLVoIZBDi8C6q3vzK8sl8VJx/Lz+eLzL9q5hlkhWgfYtnB4zgo1
 Vl69tTsZh9Qx1E6fivwYqtIzuhCdNcNa5qn9vG11Zb01SJcgjWHxIEDJBsGqg7C53/
 2cHVRrQbWFh7PLiCl3kqPBo53W05Qf+6jAcLbfkKcs7hgQcOPg//yBWkK+H/Lmxrv2
 VLH2nwg/E0XZNcLdwn21FLSUlfOwyi1yol9WQtZhU9tnI9lzmCx+SFbtwbjG2I2dlF
 GyUBWDmuiGvOA==
Date: Fri, 2 Dec 2022 13:22:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v1 0/6] kselftest/alsa: pcm-test improvements
Message-ID: <Y4n8IZbLvX0Eg/V9@sirena.org.uk>
References: <20221130000608.519574-1-broonie@kernel.org>
 <a55212fc-a676-2335-b861-94ba8d10f207@perex.cz>
 <87359zlz9t.wl-tiwai@suse.de> <Y4kOvNi5I8/GK1yU@sirena.org.uk>
 <87y1rqkzto.wl-tiwai@suse.de> <87wn7akzp7.wl-tiwai@suse.de>
 <66bef382-e38f-85d5-0e07-3cf672a89882@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IwyGX8jMV1S5RL5G"
Content-Disposition: inline
In-Reply-To: <66bef382-e38f-85d5-0e07-3cf672a89882@perex.cz>
X-Cookie: Ego sum ens omnipotens.
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
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


--IwyGX8jMV1S5RL5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 02, 2022 at 09:56:39AM +0100, Jaroslav Kysela wrote:
> On 02. 12. 22 8:54, Takashi Iwai wrote:
> > Takashi Iwai wrote:

> > > > Oh, this is getting a little confusing - I'd just picked Jaroslav's
> > > > patch into my tree and was in the middle redoing my ideas on top of his
> > > > code!  I might have something more later this evening...  I think we can
> > > > converge here, let me continue taking a look.

> > > Ah then it was my misunderstanding, and everything should be fine now
> > > ;)  Thanks!

> > Erm, you meant sent as *v3*.  I've seen now.

> > As the v2 patches were already merged, could you rather rebase and
> > resubmit?  I'd like to avoid rebase the full series that are already
> > included in linux-next.

> It's rebased. The first patch from the set drops the previous Mark's changes.

Indeed, there was so many collisions with Jaroslav's patches
which it just seemed like the most straightforward way to do
things (plus I'd already written a good chunk of the new version
by the time you applied my v2).  Probably only a small bit of the
skipping code would end up remaining anyway.

--IwyGX8jMV1S5RL5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOJ/CAACgkQJNaLcl1U
h9DShAf+JiDRTGD6uE6v776djG9zR6+KoZIXbF0n/JUYuX8L8zWGqg8vnGPzx8tm
ZVG3h81yBYxqkNyChimYPUpotJxI7B8RDiZBGXYk/Prr7Zd3DHuBzSq3BdqDG/u4
X5DMruB6+U5N5GOiMJSpKWJ0y+LNVpffKDoyA2/PKx3VgYmydU0DJ8Rcf/VFmR2V
/7sY/PINwasgvW8igbw1KNiAgMdQGdUcZDB3rpbjboUbDB4AanWFv0ULAQxQojy5
J7zPnbe8FFid2NE8ofVRbAeS3Q/BLnyq4tVMRDApv7zVWNZAVRnWFNDpqa5Mnn3d
ijAzxPl0j2ks2URDkqGEaeONEtraeg==
=aHCd
-----END PGP SIGNATURE-----

--IwyGX8jMV1S5RL5G--
