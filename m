Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B19D083A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 09:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF3101657;
	Wed,  9 Oct 2019 09:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF3101657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570606056;
	bh=wgfmcJJJdsooULi3DPwwaq/TfM9JFk4+gk0Cdq9eQWA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nyspbLKWuqjbh+ubYpl0yqoChdBk/CUQCflgZDMkktUtKrsPXecXg7yK8wYIBV/Rj
	 6sek8na4PWBIO5H+Ah5We+LuCJHswDUuMwJzJs6cGIthgMySOqaM0bVNaOOTSwXUe+
	 ekfWbUD8y270cRdLXQiFi5IJg8nuXGve9zHugtuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E4FF802FB;
	Wed,  9 Oct 2019 09:25:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E77CF802BE; Wed,  9 Oct 2019 09:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9E6CF800BF
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 09:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E6CF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 00:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="277346967"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by orsmga001.jf.intel.com with ESMTP; 09 Oct 2019 00:25:38 -0700
To: Tzung-Bi Shih <tzungbi@google.com>, kbuild test robot <lkp@intel.com>,
 Guenter Roeck <groeck@google.com>
References: <20191005164320.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <201910060040.RXI5XB2W%lkp@intel.com>
 <CA+Px+wUqwjPKkbZAfJ0+a6JAhxRqGLqq_JRY6Qwoh49JrxKr8w@mail.gmail.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <e02d6319-77b2-b74d-883e-7ec87c5bd1fc@intel.com>
Date: Wed, 9 Oct 2019 15:25:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUqwjPKkbZAfJ0+a6JAhxRqGLqq_JRY6Qwoh49JrxKr8w@mail.gmail.com>
Content-Language: en-US
Cc: Gwendal Grignou <gwendal@google.com>, devicetree@vger.kernel.org,
 ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Nicolas Boichat <drinkcat@google.com>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, kbuild-all@01.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [kbuild-all] Re: [PATCH v2 07/10] ASoC:
 cros_ec_codec: support WoV
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/7/19 3:04 PM, Tzung-Bi Shih wrote:
> On Sun, Oct 6, 2019 at 12:54 AM kbuild test robot <lkp@intel.com> wrote:
>> url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/ASoC-mediatek-mt8183-mt6358-ts3a227-max98357-support-WoV/20191005-171021
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>> reproduce:
>>          # apt-get install sparse
>>          # sparse version: v0.6.1-rc1-42-g38eda53-dirty
>>          make ARCH=x86_64 allmodconfig
>>          make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>>
>> sparse warnings: (new ones prefixed by >>)
>>
>>>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <asvoid * @@
>>>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    expected void *
>>>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    got void [noderef] <asn:2> *
>>>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
>>>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    expected void const volatile [noderef] <asn:2> *
>>>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    got unsigned char [usertype] *addr
>>>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
>>>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    expected void volatile [noderef] <asn:2> *
>>>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    got unsigned char [usertype] *wov_lang_shm_p
>>     sound/soc/codecs/cros_ec_codec.c:699:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
>>     sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    expected void volatile [noderef] <asn:2> *
>>>> sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    got unsigned char [usertype] *
> I cannot reproduce the same sparse errors.
>
> My commit stack: apply my patches onto broonie/sound.git for-next
> $ git log --oneline
> b4471777f5d8 (HEAD -> draft) ASoC: mediatek: mt8183: support WoV
> b6bb558fa59d ASoC: dt-bindings: mt8183: add ec-codec
> a08bede115d4 ASoC: mediatek: mt6358: support WoV
> f67068fd0c91 ASoC: cros_ec_codec: support WoV
> 7e11271c070e ASoC: dt-bindings: cros_ec_codec: add SHM bindings
> fd04f20e77d3 ASoC: cros_ec_codec: read max DMIC gain from EC codec
> c008f01d5bc3 platform/chrome: cros_ec: add common commands for EC codec
> 50d2c1f9b1f4 ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
> 00e5a1c121eb ASoC: cros_ec_codec: refactor I2S RX
> 3f0c475d6ec8 platform/chrome: cros_ec: remove unused EC feature
> 3877dcd0194c (mark/for-next, asoc-next) Merge branch 'asoc-5.5' into asoc-next
>
> My reproduce steps:
> $ make ARCH=x86_64 mrproper
> $ make ARCH=x86_64 allmodconfig
> $ make ARCH=x86_64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' -j40
> 2>&1 | grep -v sched | tee log.txt
> (Note: filter sched out to not get flood sparse errors)
> $ grep cros_ec_codec log.txt
>    CHECK   sound/soc/codecs/cros_ec_codec.c
>    CC [M]  sound/soc/codecs/cros_ec_codec.o
>
> It did not generate the same message as 0day reported.
>
> One difference would be the sparse version (it is from "apt install"
> in my environment):
> $ sparse --version
> 0.6.0 (Debian: 0.6.0-3)
> On the other hand, 0day used "v0.6.1-rc1-42-g38eda53-dirty".

Hi,

The sparse warnings could be generated by the latest sparse
(https://github.com/lucvoo/sparse.git). Could you try again?

Best Regards,
Rong Chen

>
> Guenter, what we could do in the case?  Do you have any idea?
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
