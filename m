Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB811B29D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 11:16:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ECA516DE;
	Mon, 13 May 2019 11:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ECA516DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557738960;
	bh=AWmB11k58Y9k5mUDpYKi2Bh2xEwWyolw0MdSEA3eNGY=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=em7oluA6eth7EyDhpZSYCSj+69HIXoLk+gph80ac7l9kNAD3KupR/6eD9/DJKNDwc
	 rjhVWldcXv27jtcPA3JMmoevTWkVHtF/9docBXQ4jKfJku3tlD7C397dEVxkFGG1aq
	 C0R85bqUSCCQXtcZQsT+rQGtG9Oa4b/RAv7ecmlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB38DF8968A;
	Mon, 13 May 2019 11:14:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D14F89684; Mon, 13 May 2019 11:14:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28FE4F8072A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 11:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28FE4F8072A
Received: from abudhabi.paradoxon.rec (p54A9D85F.dip0.t-ipconnect.de
 [84.169.216.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: polynomial-c)
 by smtp.gentoo.org (Postfix) with ESMTPSA id 085B93441BF;
 Mon, 13 May 2019 09:14:06 +0000 (UTC)
Date: Mon, 13 May 2019 11:13:58 +0200
From: Lars Wendler <polynomial-c@gentoo.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190513111358.73510257@abudhabi.paradoxon.rec>
In-Reply-To: <s5hh8og8v3a.wl-tiwai@suse.de>
References: <20180409151616.6c8338a7@abudhabi.paradoxon.rec>
 <s5hh8og8v3a.wl-tiwai@suse.de>
Organization: Gentoo
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, alsa-bugs@gentoo.org
Subject: Re: [alsa-devel] alsa-lib-1.1.6.tar.bz2: some files are missing in
 the tarball
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
Content-Type: multipart/mixed; boundary="===============8655437897794955633=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============8655437897794955633==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_//6nlpVArOKG0JClRI8AXegq"; protocol="application/pgp-signature"

--Sig_//6nlpVArOKG0JClRI8AXegq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Apr 2018 14:31:21 +0200 Takashi Iwai wrote:

>On Mon, 09 Apr 2018 15:16:16 +0200,
>Lars Wendler wrote:
>>=20
>> Hello list,
>>=20
>> please have a look at this Gentoo bug report [1] where a user
>> reported that he cannot compile alsa-lib-1.1.6 with --enable-alisp
>> configure option. The error message is:
>>=20
>>   make[3]: *** No rule to make target 'SI7018/sndoc-mixer.alisp',
>>   needed by 'all-am'. Stop.
>>=20
>> This happens because the directory src/conf/cards/SI7018 is missing
>> as well as the following files:
>>=20
>> src/conf/cards/aliases.alisp
>> src/conf/smixer.conf
>> src/conf/sndo-mixer.alisp
>>=20
>> First I thought those files were removed intentionally but checking
>> the alsa-lib git tree I can see all files still being available. So
>> at Gentoo we fixed this by re-adding the files through a patch [2].
>>=20
>> Any chance this was an accidental oversight?
>
>It's because the contents of EXTRA_DIST also depends on the configure
>option, and the tarball was created without enabling the feature, I
>suppose.  Maybe we should fix EXTRA_DIST to list all files
>unconditionally.
>
>
>thanks,
>
>Takashi

This is still an issue with latest 1.1.9 release tarball. Did you
forget about this or do you still look for a good solution?

Lars

--=20
Lars Wendler
Gentoo package maintainer
GPG: 21CC CF02 4586 0A07 ED93  9F68 498F E765 960E 9B39

--Sig_//6nlpVArOKG0JClRI8AXegq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEWCOBmo8i7LhvVmNAVx3S0DQ8YDkFAlzZNVYACgkQVx3S0DQ8
YDm7fQ//cWtopnpLut0UMwHMuGsiPGv7QzHPotLkXt0svZ2c6U1TmcsrzaU2PXEv
l0prj6Hueae9j39q0B3muoNjyWHOdzfwTHk0llnqlSP4hR2S5T5mvnjEuDy5znuv
AEk2uNIlIWIiQnoTJi4p8k9QxuU6TiP7z1i2A/5BLErR841f4FZZvfPABnW19aoN
5cHggRibp9pUzBDIdIqGCkqATD+/93TjQpqAwbZWlnsRU317Y2ji/G5a5oc//4Yf
epW97HKIicRRIz9NYeC9hBScediUv5DOasSuZtxbNnBBa2Bhpe3UFOR/u3wCeh8a
W0aHYu9ev9KqyHv1bWFIzx9AKQEltkfdqTRY2MGL67CNeUceBdpsIfYddHijpO2Y
+Pbl5/RVdm1uqhnH/+tGujtRw/yfd9mbAk37reLZ4Rb1wPB8DSqy25Kfe8//W7DW
GgkI6BV0zh8QWMgadrcYPOwL9ZU5tokyBmlbrwsymtMmZpafuqR/RpB8mUJcS/hb
Om+BY0XPyuK+gC+e573Sq8E8UqaRhRq8GzyrrwktZyF61oZmAWi+q64HxWR9G21I
YozF/SQyqQygpTjK77kkjY6vnXgV86Il34If4HcwWXKyYVnqLMcznn1z+8TXrSEM
roaZ8dLbJebrDPg+4mLpV257ZBgXb5iyz3MinsmBT9lS33JtrgM=
=WA0c
-----END PGP SIGNATURE-----

--Sig_//6nlpVArOKG0JClRI8AXegq--

--===============8655437897794955633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8655437897794955633==--
