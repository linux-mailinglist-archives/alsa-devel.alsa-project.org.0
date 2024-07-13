Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B81930314
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2024 03:41:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02D74950;
	Sat, 13 Jul 2024 03:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02D74950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720834884;
	bh=yxytFmDwG/sNMTq4aBNwkg9PqivKLL4mz7tWsPj24zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MZ9RIFrUlDvoRc1Gueuw9dfUCLzecz7j2y8c/O566cujR/Nmg9hvCZjxvFoWvssyQ
	 fd1Vk4cvY4OD6xoipEWEnZu7MXkt22JzWBy6cu/IO9VSKZZcduOssPyUovS1eKODs9
	 EZon3OK7qrjfm9q2XysHPGq91Hc72A/Lwqvk07Qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8345AF8019B; Sat, 13 Jul 2024 03:41:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6FDF805B2;
	Sat, 13 Jul 2024 03:41:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF40AF801F5; Sat, 13 Jul 2024 03:36:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com
 [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A71B8F8013D
	for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2024 03:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71B8F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=k2Fvaq1x;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=PK/YyL6c
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0C16D1381E73;
	Fri, 12 Jul 2024 21:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 12 Jul 2024 21:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720834551; x=
	1720920951; bh=22TDJyuRrKv8m5jGh39KDAxMi55uSQw1RcgMrw/wKfs=; b=k
	2Fvaq1x3McBDu+o1DLMirrrSCRbQRWeR/9rhJ9nXeVnTGkBKeUcviE8wtAnbuBB0
	fmUrFIiBP5l+hUUsvH2NMXfTlIybI3aM7upSyh1LNULZ/kOXrSILWyp6DfvYexNt
	NBVj6gI9foUkJuptmpr0sVsRoRAsEoWh2wxasbtF3bayPZ1TJDFtXyBW1UFsActD
	yzhCCoFsg2v5woM+LIKHJFGNjlStwp8eJDYt+TRMBY12szpWg/oINleU+0IkvV25
	phtu042YVeQ7TPuiHa6UqKvz6CbfTEiRvBR0W8V1cnDuczBqpxvjzFgTLRKdsHxX
	8RKSk7YyLmTTZxDgYwnzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720834551; x=1720920951; bh=22TDJyuRrKv8m5jGh39KDAxMi55u
	SQw1RcgMrw/wKfs=; b=PK/YyL6cJoWHCVmqovL3aUs9U8czwPz8EK2IlsMz1+7J
	jS3RYR7eRPGEWVmmlR2zcNmvwXWKioTE+rwdDnXiISMPbDShSEH1wQCU8tOD6Mg7
	yspW4BEQha0IVwlDEXUC8rqPknOUo3lWk2EZcwxnt4G3unDFoUYVdjNiFIV8wzfR
	xHJiuwn8NKoORKfw0Vbjq/NTTRjkndWtEwMBPK3/TcffeXFap/v8XMNLqJd5DxhX
	j4mQEdSjX6KKTE56bKh10K+zUtckwUQaSAo/vk7obWs2CAO090cpdg1WYfYcGsY7
	Otfv5byBJm7qaL18Y5Z8aqzxNx4/4xy9WKvikk2NuQ==
X-ME-Sender: <xms:9NmRZnY7Q90EGJ9RwEs28jeD_YRV0jRbl0usQCG13UBnoGL3LCiMGg>
    <xme:9NmRZmZxygkgS7cTX0RaFrWXQr33WuD30TwUWUUgAteRv9mHomVxUsvYXpCVF5g9z
    ndzG3Nm3uyoAH2wNcI>
X-ME-Received: 
 <xmr:9NmRZp9EfAKmsZ3KBBZWkezbV_dWzu6EwmfMUmV8UTpEfLbBP3h1vDXBQEjIBfYT9zgga-Pg0VFD-XIIFg0qLCbHNB0cpRgI7OM2>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrfeejgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeegueeivdevjeekiedvgfevtefgvefgtdelgfffheei
    veehiedthedthfejudfhleenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhtlh
    grsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:9NmRZtp9Bx7fKP69RlnuUCXNZOrR6AOlhuj8LKdWrjUtmy-odlyXCg>
    <xmx:9NmRZio2ftHf8yfzK1T5B8-hAMZqZ2uS1aFkCFeUJjLJtkSwdA1k6A>
    <xmx:9NmRZjRoBXO_hpIQnQvEnKnRzV3c7_99PKtlV_Mm31OSDeYkdZ-EwQ>
    <xmx:9NmRZqqneW-bE6v-ytnM0Tbb2uOI8t2KxnncbwuPBylObK6hvfeJJg>
    <xmx:99mRZjdqbpE-m-NdEEkULREAeprJUUiyKatHc9XiW0Y-NPsJph4n8-mW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jul 2024 21:35:46 -0400 (EDT)
Date: Sat, 13 Jul 2024 10:35:44 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Asahi Lina <lina@asahilina.net>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>
Subject: Re: Handling complex matrix mixers in ALSA
Message-ID: <20240713013544.GB107956@workstation.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	"Geoffrey D. Bennett" <g@b4.vu>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
 <8734ot42oo.wl-tiwai@suse.de>
 <20240702004611.GA1029857@workstation.local>
 <ccba37b8-0b92-43a9-83f3-297d96183855@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccba37b8-0b92-43a9-83f3-297d96183855@asahilina.net>
Message-ID-Hash: D326NGK5OSCO5PIMI6NABWQLF6ZTEZYW
X-Message-ID-Hash: D326NGK5OSCO5PIMI6NABWQLF6ZTEZYW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D326NGK5OSCO5PIMI6NABWQLF6ZTEZYW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 12, 2024 at 06:48:09PM +0900, Asahi Lina wrote:
> > For example, assuming the matrix mixer has 34 destination and 66
> > sources, they can be expressed by 34 control elements with 66 array
> > elements. A single snd_kcontrol structure can provide them, as long as
> > they have the same nature. The control elements are identified by index
> > value.
> 
> It took me a while to understand what you meant here, but I think I get
> it: Using a single snd_kcontrol for the entire mixer, with 34 indexed
> elements each taking 66 array values, right?

This is rough example for the above idea.

```
static int info_cb(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *einfo)
{
    einfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
    einfo->count = 66;                  // up to 128 for integer value array.
    einfo->value.integer.min = 0;       // note long type, varies between
                                        // ILP32/LP64 data models.
    einfo->value.integer.max = 256;     // ditto.
    einfo->value.integer.step = 1;      // ditto.

    return 0;
}

static int get_cb(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uval)
{
    unsigned int index = snd_ctl_get_ioff(kctl, &info->id);

    // Any operation according to the index of control elements in the set.

    return 0;
}

static int put_cb(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *uval)
{
    unsigned int offset = snd_ctl_get_ioff(kctl, &info->id);

    // Any operation according to the index of control elements in the set.

    return 0;
}

int add_control_elements(struct my_data *my_data)
{
    // Emulate AK4396.
    // 20 * log10(x/255) (dB)
    // Here, x is written value.
    //
    // Some examples in:
    // https://github.com/alsa-project/alsa-lib/blob/master/test/user-ctl-element-set.c.
    static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(range_tlv, -4813, 0);
    
    static const struct snd_kcontrol_new template = {
        . iface = SNDRV_CTL_ELEM_IFACE_MIXER,
        .device = 10,
        .subdevice = 20,
        .name = "multiplexer",
        .index = 0,
        // I guess any operation on ARC USB does not control the hardware directly unlike RC and
        // ARC, thus SNDRV_CTL_ELEM_ACCESS_VOLATILE is not required.
        .access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ,
        .count = 34,        // The total number of control elements in the set.
        .info = info_cb,
        .get = get_cb,
        .put = pub_cb,
        .tlv.p = &range_tlv,
    };
    
    struct snd_kcontrol *kctl = snd_ctl_new1(&template, my_data);
    err = snd_ctl_add(my_data->card, kctl);
    ...
}
```

> How do these kinds of controls show up in alsamixer and other userspace
> mixer tools? Are they usable at all, or just with low-level access via
> amixer/alsactl?

These control elements can be enumerated and operated as usual, just
have the sequential value in index (and numid) field in element
identifier.

```
$ amixer -c 0 controls
...
numid=16,iface=MIXER,name='multiplexer',device=10,subdevice=20
numid=17,iface=MIXER,name='multiplexer',index=1,device=10,subdevice=20
numid=18,iface=MIXER,name='multiplexer',index=2,device=10,subdevice=20
numid=19,iface=MIXER,name='multiplexer',index=3,device=10,subdevice=20
numid=20,iface=MIXER,name='multiplexer',index=4,device=10,subdevice=20
numid=21,iface=MIXER,name='multiplexer',index=5,device=10,subdevice=20
numid=22,iface=MIXER,name='multiplexer',index=6,device=10,subdevice=20
numid=23,iface=MIXER,name='multiplexer',index=7,device=10,subdevice=20
numid=24,iface=MIXER,name='multiplexer',index=8,device=10,subdevice=20
numid=25,iface=MIXER,name='multiplexer',index=9,device=10,subdevice=20
...
```

Of cource, these is no integrations in any type of alsa-lib mixer API
abstractions. I use Quasmixer in quastools project to operate them.

* https://gitlab.com/sebholt/qastools


Regards

Takashi Sakamoto
