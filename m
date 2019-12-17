Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB4123117
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 17:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB841666;
	Tue, 17 Dec 2019 17:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB841666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576598781;
	bh=sjeSlBMvaekf8VDxFzm9eJUcqUIPgxiSoOQFfS9+Bu8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CTIUvDHEB+uODhOZQO8XbDw6VR+lUX0QNFJVEw9f0Km6BqCm24NUdWxPfcWUa55B7
	 PPXfN+u2sV7r98PuWiM5tRYjPNG4vrsVLedpFpNE4LmtKh3H9l1VTdbB88DHhcYd9A
	 UorhJrgHzBMuQQqdacasYCHcD1etb9QyFNv0Yc+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65C89F80234;
	Tue, 17 Dec 2019 17:04:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EC93F80234; Tue, 17 Dec 2019 17:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFC7DF80088
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 17:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFC7DF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="ghEfgYlh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pz2TWNx/nYHSnb/3v/c/XUDOnHlIu5NwAdxkQteJrQ=; b=ghEfgYlhDr7qiiNNbCkaK1FGg
 Bh+3P6BA8Uvi66XxHM6UyhadULk5T9fu+dMgimux+e/KPIbYTv/vvIB4M4Rgs3kV2uBaRGe9JL7DX
 T/mmRCI3DGEPyQBdClpL6FLBtHimCtpDAneO+AzQaJBF8PcS1tMxffLIuxFzjbBysOjZD2P6gjImW
 1dws1VEHxdiyXAzLPuBkfd0mS1CvqNaun0mUR6gA+4AXjF0VyRdXTXIkQIWbvssSlxhv/MJ66sY2C
 ouYIv5QVzw4Yi8wihvqpZYhzpqNTaQ2ZdhvgEKpkaOKyquYEmy8L/2UkMUx6W31UAGLJHA7dzGX4q
 ibKKSvEqg==;
Received: from [2601:1c0:6280:3f0::fee9]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihFKj-00034V-UO; Tue, 17 Dec 2019 16:04:25 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191217130829.6a66b404@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c4fd86fb-586a-0fbc-74b0-97e6b99ef2ca@infradead.org>
Date: Tue, 17 Dec 2019 08:04:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217130829.6a66b404@canb.auug.org.au>
Content-Language: en-US
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [alsa-devel] linux-next: Tree for Dec 17
 (sound/soc/intel/boards/cml_rt1011_rt5682.o)
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/16/19 6:08 PM, Stephen Rothwell wrote:
> Hi all,
> =

> Changes since 20191216:
> =


on x86_64:

  CC      sound/soc/intel/boards/cml_rt1011_rt5682.o
../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:4: error: =91struct snd_s=
oc_codec_conf=92 has no member named =91dev_name=92
   .dev_name =3D "i2c-10EC1011:00",
    ^~~~~~~~
../sound/soc/intel/boards/cml_rt1011_rt5682.c:407:50: warning: missing brac=
es around initializer [-Wmissing-braces]
 static struct snd_soc_codec_conf rt1011_conf[] =3D {
                                                  ^
../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:15:
   .dev_name =3D "i2c-10EC1011:00",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:413:4: error: =91struct snd_s=
oc_codec_conf=92 has no member named =91dev_name=92
   .dev_name =3D "i2c-10EC1011:01",
    ^~~~~~~~
../sound/soc/intel/boards/cml_rt1011_rt5682.c:407:50: warning: missing brac=
es around initializer [-Wmissing-braces]
 static struct snd_soc_codec_conf rt1011_conf[] =3D {
                                                  ^
../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:15:
   .dev_name =3D "i2c-10EC1011:00",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:413:15:
   .dev_name =3D "i2c-10EC1011:01",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:417:4: error: =91struct snd_s=
oc_codec_conf=92 has no member named =91dev_name=92
   .dev_name =3D "i2c-10EC1011:02",
    ^~~~~~~~
../sound/soc/intel/boards/cml_rt1011_rt5682.c:407:50: warning: missing brac=
es around initializer [-Wmissing-braces]
 static struct snd_soc_codec_conf rt1011_conf[] =3D {
                                                  ^
../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:15:
   .dev_name =3D "i2c-10EC1011:00",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:413:15:
   .dev_name =3D "i2c-10EC1011:01",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:417:15:
   .dev_name =3D "i2c-10EC1011:02",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:421:4: error: =91struct snd_s=
oc_codec_conf=92 has no member named =91dev_name=92
   .dev_name =3D "i2c-10EC1011:03",
    ^~~~~~~~
../sound/soc/intel/boards/cml_rt1011_rt5682.c:407:50: warning: missing brac=
es around initializer [-Wmissing-braces]
 static struct snd_soc_codec_conf rt1011_conf[] =3D {
                                                  ^
../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:15:
   .dev_name =3D "i2c-10EC1011:00",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:413:15:
   .dev_name =3D "i2c-10EC1011:01",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:417:15:
   .dev_name =3D "i2c-10EC1011:02",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:421:15:
   .dev_name =3D "i2c-10EC1011:03",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:407:50: warning: missing brac=
es around initializer [-Wmissing-braces]
 static struct snd_soc_codec_conf rt1011_conf[] =3D {
                                                  ^
../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:15:
   .dev_name =3D "i2c-10EC1011:00",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:413:15:
   .dev_name =3D "i2c-10EC1011:01",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:417:15:
   .dev_name =3D "i2c-10EC1011:02",
               {                }
../sound/soc/intel/boards/cml_rt1011_rt5682.c:421:15:
   .dev_name =3D "i2c-10EC1011:03",
               {                }
make[5]: *** [../scripts/Makefile.build:266: sound/soc/intel/boards/cml_rt1=
011_rt5682.o] Error 1


-- =

~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
