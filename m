Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220BA8FF8E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 12:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DFF484D;
	Fri, 16 Aug 2019 11:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DFF484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565949611;
	bh=OIBgWcWHUZJw24l/LzkHkY1K5hlXz4n+iXE83epXMcE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eNUfccp3M+mnwhPUqnFzwMhynzf3pqOtxVuuz0tVIUYr5Cy9XY2yr+4LLPnUoryM5
	 HF4+pNIXx3baWskO921GVA970KthVkBl67yqK45YFqk+ug8Au4WyGQjjZFIVEaqbFA
	 aaKFvsuaPCh1RNZLRsUS/oxTjiqyC2iIS5Qz/Dkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38882F80214;
	Fri, 16 Aug 2019 11:58:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D14FCF80214; Fri, 16 Aug 2019 11:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735ABF8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 11:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735ABF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U1i6AXWw"
Received: from localhost (unknown [117.99.90.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73DF12133F;
 Fri, 16 Aug 2019 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565949501;
 bh=/WSy9j2iYT01Rxs8gxmHUnYV6ztO0QAJLRoEe22qF1I=;
 h=Date:From:To:Cc:Subject:From;
 b=U1i6AXWwH+cLHbsqKrjdQTNc55sAomcu9Idiy99msv3yQQyvkVonLOj38vMG3yhpu
 DRkPMibTminSVYQ80+Fr9hVeb4KszDs/1srD1eF1YW3ZRF24qzK0m84c9il1/TK7UA
 DdhXtzgcjvuPrsIEKfjBE5D8UkWOXEP49xz9c4zo=
Date: Fri, 16 Aug 2019 15:27:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190816095709.GC12733@vkoul-mobl.Dlink>
MIME-Version: 1.0
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [GIT PULL] soundwire fixes for v5.4-rc5
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
Content-Type: multipart/mixed; boundary="===============2209069250806725926=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2209069250806725926==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

We have couple of fixes queued up, please pull. Some more are in review,
will send them later.
These fixes are in linux-next as well.

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.3-rc5

for you to fetch changes up to 8676b3ca4673517650fd509d7fa586aff87b3c28:

  soundwire: fix regmap dependencies and align with other serial links (201=
9-08-09 10:20:40 +0530)

----------------------------------------------------------------
soundwire fixes for v5.3-rc5

Pierre sent fixes which are queued now for v5.3-rc5 are:
 - regmap dependecy
 - cadence register definitions

----------------------------------------------------------------
Pierre-Louis Bossart (3):
      soundwire: cadence_master: fix register definition for SLAVE_STATE
      soundwire: cadence_master: fix definitions for INTSTAT0/1
      soundwire: fix regmap dependencies and align with other serial links

 drivers/base/regmap/Kconfig        | 2 +-
 drivers/soundwire/Kconfig          | 7 +------
 drivers/soundwire/Makefile         | 2 +-
 drivers/soundwire/cadence_master.c | 8 ++++----
 4 files changed, 7 insertions(+), 12 deletions(-)

Thanks
--=20
~Vinod

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdVn31AAoJEHwUBw8lI4NHbucQAM+0LcMCYEANet0ypYgl51j2
k8EUiwGmk+QFnyOuBmjQy57Q6SxLLBRDx5+rbXUro9AuZaWae+sobMeK/OYw++3c
PMs7s4X5bU3I9qibnv6yco4G3jh7LOraFKXbWPTL/LuJcnThTo6ml9pt1Od7dccY
FzcE0bZ/AJgN37+Oa/Wsb85gvX5Cdg5lKRqcVhFQZX3I/hvqN4Cs7dRa8UsO2xON
ZtpOdKHCchR1URSzVqWhpGIxgU1L8eBLlh0BKFeoSrVBv5Gb8XcJmCa5ypM6nZpQ
Ra3Rdv5PXJ3clrj93C2+3pwY17wISjQKjcWeo/esCmxm+Psq3sRo61hO8PFkuGm6
xNHC2djcYPyMlmPwQp75Xfr2SOAWr1Ca9W4jk2V4A3hxQ/cpocYFy9BGs9O4wzGV
kaJFeS9mBQxgMYEqinu2KeS2Ek313Q2Y8c89m924FBzCSpIlUehZImgACukMigI/
TYnk0lpMk3InbS3uHJOKQQRpMclgbhFg4x3HzFmaeYKKZGlraNUWiXYf7+ZNbBTR
o2Cqqe3CwYRsZW5EUlazQW8ZTctoGCnu26noLLKkhOecmSWNW8f3HS4/koGWTQPf
KemgIL7ZpIDOzQ5DhmcOJmCkIS8IPw8S2S7SsV1VWl4Ns2wqLv/pVOOizHaR0OLu
mJOnsFTTkm54zmzvcmAp
=JH/o
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--

--===============2209069250806725926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2209069250806725926==--
