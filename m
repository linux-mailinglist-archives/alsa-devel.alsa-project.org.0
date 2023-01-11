Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC48665647
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 09:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880BAE2FB;
	Wed, 11 Jan 2023 09:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880BAE2FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673426396;
	bh=2JFiNFTVGgBQrdHk4k8MmU/fu7xUdUL/MJJxSDMd5GI=;
	h=Subject:From:In-Reply-To:Date:References:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X2s3JTZZcaT5XJDs0k4wfbPh7o9H5MACmcdM7Fs1hqG9cXd9W+orDxafmjon0yCiT
	 MhtVnT1iBO0Pz4bQzFn5y/7Y4vRHoyYSOp+6fi3IS7xnio1/zdObI4lwNai0dM8e8h
	 j+HhjIWLxnwIR8og8eDiqrT6oFTBt1LQscJlS7qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFEFCF8016E;
	Wed, 11 Jan 2023 09:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75824F803DC; Wed, 11 Jan 2023 09:38:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8323CF8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 09:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8323CF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=jB92gv8A
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1673426330; bh=tYUkvP1LL/oKjpBzUtCikUMIK2n3hYe7+3rcbguWTLI=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=jB92gv8ARa5tL/VyJEF/uCMfvl1vtEXMwuAMJ+MMC63FMtUet8XBJLP3KY9UXwe7u
 crj5snAwBqlFuMS+Tg4NgOWDTEwk2mJl81z/lGeAJRQ0/GkSWMi0n5JMVz7EkJb2en
 3dIorM7Y2WBeYwV6O3Y6GSej5fdPsDMEIbI5b5Gs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH V9 4/5] ASoC: codecs: Aw883xx chip register file, data
 type file and Kconfig Makefile
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20230111020233.4306-1-wangweidong.a@awinic.com>
Date: Wed, 11 Jan 2023 09:38:47 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <5EA7B038-9B49-4E5D-8209-8689C0D03071@cutebit.org>
References: <202301100233.QuEJ8pyu-lkp@intel.com>
 <20230111020233.4306-1-wangweidong.a@awinic.com>
To: wangweidong.a@awinic.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: cezary.rojewski@intel.com, steve@sk2.org, llvm@lists.linux.dev,
 Linux-ALSA <alsa-devel@alsa-project.org>, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 yangxiaohua@everest-semi.com, lkp@intel.com, daniel.beer@igorinstitute.com,
 pierre-louis.bossart@linux.intel.com, flatmax@flatmax.com,
 devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com, zhaolei@awinic.com,
 james.schulman@cirrus.com, rf@opensource.cirrus.com, robh+dt@kernel.org,
 oe-kbuild-all@lists.linux.dev, jonathan.albrieux@gmail.com, tiwai@suse.com,
 liweilei@awinic.com, lgirdwood@gmail.com, yijiangtao@awinic.com,
 Mark Brown <broonie@kernel.org>, 13691752556@139.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> On 11. 1. 2023, at 3:02, wangweidong.a@awinic.com wrote:
>=20
> On 09/01/2023 03:00, kernel test robot wrote:

>> All errors (new ones prefixed by >>):
>=20
>>>> ld.lld: error: undefined symbol: crc8_populate_lsb
>>>>> referenced by aw883xx_bin_parse.c:1049 =
(sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:1049)
>>>>>              vmlinux.o:(aw883xx_dev_load_acf_check)
>> --
>>>> ld.lld: error: undefined symbol: crc8
>>>>> referenced by aw883xx_bin_parse.c:963 =
(sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:963)
>>>>>              vmlinux.o:(aw883xx_dev_load_acf_check)
>>>>> referenced by aw883xx_bin_parse.c:1022 =
(sound/soc/codecs/aw883xx/aw883xx_bin_parse.c:1022)
>>>>>              vmlinux.o:(aw883xx_dev_load_acf_check)
>>>>> did you mean: crc4
>>>>> defined in: vmlinux.o
>=20
> This looks like a false positive. crc8_populate_lsb is defined in the =
lib/crc8.c file.
> I also could not reproduce it with GCC.

Hi,

the issue here would be that it=E2=80=99s possible to select your driver =
for compilation without
having selected the CRC8 functions, leading to the linkage error.

You can fix that by adding =E2=80=99select CRC8=E2=80=99 under the =
Kconfig section of your driver, similarly
to how the SND_SOC_SIGMADSP symbol selects CRC32.

Best regards,
Martin

>=20
> Best regards,
> Weidong Wang

