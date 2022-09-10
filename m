Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24B5B4778
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 18:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01E9C168F;
	Sat, 10 Sep 2022 18:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01E9C168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662827001;
	bh=efJ9LLpobLi3fzanoWnSpViBmiBe1Y+IqfCPHDckYec=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lmtEelCkU81JP1UfIFGnmA4sS6POjHk17ToZpe4EUYHOsnxbpnaJYOi4WI+cEDSA9
	 Aso9+BMC+Tb3yIZ3llDNBtFR1P9Wo7494GBS4mzA6sosOBttzq+91XP7n/pDs8Tfpb
	 OhaoMeGZU9sfBm4aTNFBtgPxClxQ3Zg/3RZISsHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E028F80448;
	Sat, 10 Sep 2022 18:22:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39E85F8042F; Sat, 10 Sep 2022 18:22:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D28EF8011C
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 18:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D28EF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="YiV40PkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662826934;
 x=1694362934; h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=hakuPEOnnc3c0mrrjhfOQ7H5w96qBkXn9g7V45vZzCM=;
 b=YiV40PkLa8wNIqsZp6F4Ra8kSi5ET+zNTUFG/XwDWv8RqVjR4p/V0kc/
 3xfUCne2J8LKTzbYgvV32YqL1juPcPArWxxdq70bSSH7U8ejZvFPe/+n/
 KUR/0XHbd0t3nSKm689/RaOEGUs7EdiYWNRVdb35wzSY8JaH0bMY745j/
 G4Yc0Z8Eab2bOnfoNR3UO9UN1+DtAgLL6H+9BM5wf+j22xSEjqL5Uo3Dt
 n8nGCnLFkPB9Av8F1TdPXGA7WrBQnf7qXStdxj0AD545sDR0AcixOKjLe
 Q1lsoRzAshPa8N7TnVKZ0nChDfJUJRXHAikNyuXTPJeJM3ieJV1U3Fexq Q==;
From: Astrid Rost <Astrid.Rost@axis.com>
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driver
Thread-Topic: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driver
Thread-Index: AQHYxC6/ejOgq/n9BUqMIHjkPKoKKK3Ym/OAgAA+pl8=
Date: Sat, 10 Sep 2022 16:22:12 +0000
Message-ID: <AM9PR02MB6673AF3C72BA512B165D45A59B429@AM9PR02MB6673.eurprd02.prod.outlook.com>
References: <20220909093001.13110-1-astrid.rost@axis.com>,
 <202209102203.mk6PQ3fD-lkp@intel.com>
In-Reply-To: <202209102203.mk6PQ3fD-lkp@intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: kernel <kernel@axis.com>,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hello,

Sorry, I did not see this in the checks I run. It is the first time I try t=
o commit something. Still confusing.
Yes, I will do the yaml conversion.

Astrid

Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: kernel test robot <lkp@intel.com>
Sent: Saturday, September 10, 2022 4:37:59 PM
To: Astrid Rost <astrid.rost@axis.com>; Mark Brown <broonie@kernel.org>; Li=
am Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; Takash=
i Iwai <tiwai@suse.com>
Cc: kbuild-all@lists.01.org <kbuild-all@lists.01.org>; alsa-devel-mejlingli=
stan <alsa-devel@alsa-project.org>; kernel@axis.com <kernel@axis.com>; Astr=
id Rost <astrid.rost@axis.com>; linux-kernel@vger.kernel.org <linux-kernel@=
vger.kernel.org>
Subject: Re: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driv=
er

Hi Astrid,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Astrid-Rost/ASoC-ts3=
a227e-allow-enabling-the-jack-detect-in-driver/20220909-173508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
config: arm64-randconfig-c023-20220909
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f147a518459c71521cf=
e5bc786b804ba317091a0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Astrid-Rost/ASoC-ts3a227e-allow-en=
abling-the-jack-detect-in-driver/20220909-173508
        git checkout f147a518459c71521cfe5bc786b804ba317091a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_s=
uspend':
   drivers/usb/dwc3/dwc3-qcom.c:314: undefined reference to `usb_hub_find_c=
hild'
   drivers/usb/dwc3/dwc3-qcom.c:314:(.text+0xea8): relocation truncated to =
fit: R_AARCH64_CALL26 against undefined symbol `usb_hub_find_child'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_register'=
:
>> sound/core/jack.c:119: undefined reference to `input_set_capability'
   sound/core/jack.c:119:(.text+0x25c): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `input_set_capability'
>> aarch64-linux-ld: sound/core/jack.c:122: undefined reference to `input_r=
egister_device'
   sound/core/jack.c:122:(.text+0x280): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `input_register_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_disconnec=
t':
>> sound/core/jack.c:54: undefined reference to `input_unregister_device'
   sound/core/jack.c:54:(.text+0x380): relocation truncated to fit: R_AARCH=
64_CALL26 against undefined symbol `input_unregister_device'
>> aarch64-linux-ld: sound/core/jack.c:56: undefined reference to `input_fr=
ee_device'
   sound/core/jack.c:56:(.text+0x38c): relocation truncated to fit: R_AARCH=
64_CALL26 against undefined symbol `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_new':
>> sound/core/jack.c:535: undefined reference to `input_allocate_device'
   sound/core/jack.c:535:(.text+0x970): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `input_allocate_device'
>> aarch64-linux-ld: sound/core/jack.c:547: undefined reference to `input_s=
et_capability'
   sound/core/jack.c:547:(.text+0x9e0): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `input_set_capability'
   aarch64-linux-ld: sound/core/jack.c:569: undefined reference to `input_f=
ree_device'
   sound/core/jack.c:569:(.text+0xab4): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_report':
>> include/linux/input.h:425: undefined reference to `input_event'
   include/linux/input.h:425:(.text+0xef8): relocation truncated to fit: R_=
AARCH64_CALL26 against undefined symbol `input_event'
>> aarch64-linux-ld: include/linux/input.h:445: undefined reference to `inp=
ut_event'
   include/linux/input.h:445:(.text+0xf5c): relocation truncated to fit: R_=
AARCH64_CALL26 against undefined symbol `input_event'
   aarch64-linux-ld: include/linux/input.h:450: undefined reference to `inp=
ut_event'
   include/linux/input.h:450:(.text+0xf98): additional relocation overflows=
 omitted from the output


vim +119 sound/core/jack.c

bd8a71a7b0f50d Mark Brown         2009-01-03   39
32b8544296b944 Takashi Iwai       2013-11-14   40  static int snd_jack_dev_=
disconnect(struct snd_device *device)
e76d8ceaaff9d7 Mark Brown         2008-07-28   41  {
fe0d128c57bf92 Takashi Iwai       2016-02-17   42  #ifdef CONFIG_SND_JACK_I=
NPUT_DEV
e76d8ceaaff9d7 Mark Brown         2008-07-28   43        struct snd_jack *j=
ack =3D device->device_data;
e76d8ceaaff9d7 Mark Brown         2008-07-28   44
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   45        mutex_lock(&ja=
ck->input_dev_lock);
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   46        if (!jack->inp=
ut_dev) {
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   47                mutex_=
unlock(&jack->input_dev_lock);
32b8544296b944 Takashi Iwai       2013-11-14   48                return 0;
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   49        }
9d59065cd6fae8 Takashi Iwai       2009-04-14   50
e76d8ceaaff9d7 Mark Brown         2008-07-28   51        /* If the input de=
vice is registered with the input subsystem
e76d8ceaaff9d7 Mark Brown         2008-07-28   52         * then we need to=
 use a different deallocator. */
e76d8ceaaff9d7 Mark Brown         2008-07-28   53        if (jack->register=
ed)
e76d8ceaaff9d7 Mark Brown         2008-07-28  @54                input_unre=
gister_device(jack->input_dev);
e76d8ceaaff9d7 Mark Brown         2008-07-28   55        else
e76d8ceaaff9d7 Mark Brown         2008-07-28  @56                input_free=
_device(jack->input_dev);
32b8544296b944 Takashi Iwai       2013-11-14   57        jack->input_dev =
=3D NULL;
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   58        mutex_unlock(&=
jack->input_dev_lock);
fe0d128c57bf92 Takashi Iwai       2016-02-17   59  #endif /* CONFIG_SND_JAC=
K_INPUT_DEV */
32b8544296b944 Takashi Iwai       2013-11-14   60        return 0;
32b8544296b944 Takashi Iwai       2013-11-14   61  }
32b8544296b944 Takashi Iwai       2013-11-14   62
32b8544296b944 Takashi Iwai       2013-11-14   63  static int snd_jack_dev_=
free(struct snd_device *device)
32b8544296b944 Takashi Iwai       2013-11-14   64  {
32b8544296b944 Takashi Iwai       2013-11-14   65        struct snd_jack *j=
ack =3D device->device_data;
9058cbe1eed293 Jie Yang           2015-04-27   66        struct snd_card *c=
ard =3D device->card;
9058cbe1eed293 Jie Yang           2015-04-27   67        struct snd_jack_kc=
tl *jack_kctl, *tmp_jack_kctl;
32b8544296b944 Takashi Iwai       2013-11-14   68
06764dc931848c Takashi Iwai       2021-11-16   69        down_write(&card->=
controls_rwsem);
9058cbe1eed293 Jie Yang           2015-04-27   70        list_for_each_entr=
y_safe(jack_kctl, tmp_jack_kctl, &jack->kctl_list, list) {
9058cbe1eed293 Jie Yang           2015-04-27   71                list_del_i=
nit(&jack_kctl->list);
9058cbe1eed293 Jie Yang           2015-04-27   72                snd_ctl_re=
move(card, jack_kctl->kctl);
9058cbe1eed293 Jie Yang           2015-04-27   73        }
06764dc931848c Takashi Iwai       2021-11-16   74        up_write(&card->co=
ntrols_rwsem);
06764dc931848c Takashi Iwai       2021-11-16   75
32b8544296b944 Takashi Iwai       2013-11-14   76        if (jack->private_=
free)
32b8544296b944 Takashi Iwai       2013-11-14   77                jack->priv=
ate_free(jack);
32b8544296b944 Takashi Iwai       2013-11-14   78
32b8544296b944 Takashi Iwai       2013-11-14   79        snd_jack_dev_disco=
nnect(device);
e76d8ceaaff9d7 Mark Brown         2008-07-28   80
282cd76ffca781 Matt Ranostay      2008-10-25   81        kfree(jack->id);
e76d8ceaaff9d7 Mark Brown         2008-07-28   82        kfree(jack);
e76d8ceaaff9d7 Mark Brown         2008-07-28   83
e76d8ceaaff9d7 Mark Brown         2008-07-28   84        return 0;
e76d8ceaaff9d7 Mark Brown         2008-07-28   85  }
e76d8ceaaff9d7 Mark Brown         2008-07-28   86
fe0d128c57bf92 Takashi Iwai       2016-02-17   87  #ifdef CONFIG_SND_JACK_I=
NPUT_DEV
e76d8ceaaff9d7 Mark Brown         2008-07-28   88  static int snd_jack_dev_=
register(struct snd_device *device)
e76d8ceaaff9d7 Mark Brown         2008-07-28   89  {
e76d8ceaaff9d7 Mark Brown         2008-07-28   90        struct snd_jack *j=
ack =3D device->device_data;
e76d8ceaaff9d7 Mark Brown         2008-07-28   91        struct snd_card *c=
ard =3D device->card;
ebb812cb8df48e Mark Brown         2010-03-17   92        int err, i;
e76d8ceaaff9d7 Mark Brown         2008-07-28   93
e76d8ceaaff9d7 Mark Brown         2008-07-28   94        snprintf(jack->nam=
e, sizeof(jack->name), "%s %s",
2678f60d2bc05a Takashi Iwai       2009-02-18   95                 card->sho=
rtname, jack->id);
43b2cd547edcba Takashi Iwai       2015-04-30   96
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   97        mutex_lock(&ja=
ck->input_dev_lock);
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   98        if (!jack->inp=
ut_dev) {
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12   99                mutex_=
unlock(&jack->input_dev_lock);
43b2cd547edcba Takashi Iwai       2015-04-30  100                return 0;
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12  101        }
43b2cd547edcba Takashi Iwai       2015-04-30  102
e76d8ceaaff9d7 Mark Brown         2008-07-28  103        jack->input_dev->n=
ame =3D jack->name;
e76d8ceaaff9d7 Mark Brown         2008-07-28  104
e76d8ceaaff9d7 Mark Brown         2008-07-28  105        /* Default to the =
sound card device. */
e76d8ceaaff9d7 Mark Brown         2008-07-28  106        if (!jack->input_d=
ev->dev.parent)
1f3fff7bda95b7 Kay Sievers        2009-06-10  107                jack->inpu=
t_dev->dev.parent =3D snd_card_get_device_link(card);
e76d8ceaaff9d7 Mark Brown         2008-07-28  108
ebb812cb8df48e Mark Brown         2010-03-17  109        /* Add capabilitie=
s for any keys that are enabled */
ebb812cb8df48e Mark Brown         2010-03-17  110        for (i =3D 0; i < =
ARRAY_SIZE(jack->key); i++) {
ebb812cb8df48e Mark Brown         2010-03-17  111                int testbi=
t =3D SND_JACK_BTN_0 >> i;
ebb812cb8df48e Mark Brown         2010-03-17  112
ebb812cb8df48e Mark Brown         2010-03-17  113                if (!(jack=
->type & testbit))
ebb812cb8df48e Mark Brown         2010-03-17  114                        co=
ntinue;
ebb812cb8df48e Mark Brown         2010-03-17  115
ebb812cb8df48e Mark Brown         2010-03-17  116                if (!jack-=
>key[i])
ebb812cb8df48e Mark Brown         2010-03-17  117                        ja=
ck->key[i] =3D BTN_0 + i;
ebb812cb8df48e Mark Brown         2010-03-17  118
ebb812cb8df48e Mark Brown         2010-03-17 @119                input_set_=
capability(jack->input_dev, EV_KEY, jack->key[i]);
ebb812cb8df48e Mark Brown         2010-03-17  120        }
ebb812cb8df48e Mark Brown         2010-03-17  121
e76d8ceaaff9d7 Mark Brown         2008-07-28 @122        err =3D input_regi=
ster_device(jack->input_dev);
e76d8ceaaff9d7 Mark Brown         2008-07-28  123        if (err =3D=3D 0)
e76d8ceaaff9d7 Mark Brown         2008-07-28  124                jack->regi=
stered =3D 1;
e76d8ceaaff9d7 Mark Brown         2008-07-28  125
1b6a6fc5280e97 Amadeusz S=B3awi=F1ski 2022-04-12  126        mutex_unlock(&=
jack->input_dev_lock);
e76d8ceaaff9d7 Mark Brown         2008-07-28  127        return err;
e76d8ceaaff9d7 Mark Brown         2008-07-28  128  }
fe0d128c57bf92 Takashi Iwai       2016-02-17  129  #endif /* CONFIG_SND_JAC=
K_INPUT_DEV */
e76d8ceaaff9d7 Mark Brown         2008-07-28  130

--
0-DAY CI Kernel Test Service
https://01.org/lkp
