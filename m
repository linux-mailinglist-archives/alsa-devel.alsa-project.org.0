Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB01162D05
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 18:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE53116A3;
	Tue, 18 Feb 2020 18:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE53116A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582047288;
	bh=SzUpILy9kWjqLMmEO5N4Pike3HKm83xbwyAEkC+SCfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WQeyj8ai6BOzCK5CX4XsTn2VhJebsyoHGOQsb0RB8T+IZ/qMpEYUtZtLG4dlIAP9l
	 G+xNfR0+AV11mxqYTKkOk7HtJM4ZBkWBGz0pHCnWsm2Q/NKTgokxWdtDX7+4lU92NN
	 /Pv1vycUh26OWOkh74Z/FwkpMRlPWWckFe3xSOYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BE1F80137;
	Tue, 18 Feb 2020 18:33:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE03DF80148; Tue, 18 Feb 2020 18:33:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7035AF80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 18:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7035AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="11M0k9+I"
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 01IHWIVe025456
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 02:32:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01IHWIVe025456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582047139;
 bh=tutI6LnPrXwVYT3jQu3+wrkqVdTSuiMpL4M6dETzDE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=11M0k9+Iv2B1rMrnejSfMTW26PY5sl3uf4HqzZp2xhN4zpeQR1meOtGQX6d+io6ym
 +PG9UCC8kA0QH08qN+uLIrXvNNDNqwzNtx3K+8sMnPsRF095MqbMbmi+keS6voaGxr
 jdguWOuq8/iDnlxxVy/2/MXSMjotn9S9BHcb5LMvoDvH/Z5uKqH7wgD0MiqBwT0DGe
 9H35xlS2/MBCxmsdsKQiZyrjilg2QD8S9L4eENGBwaC9vsTz1AeG2vNgPiT4SubIsK
 XN3SM/Ha4HoHGDoBAGdyEunUt1aRmyYCNYXfe4mMhci12/ncNWvgNf+1/arN0r7RQk
 O2u9bGEot68Ow==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id 59so7749320uap.12
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 09:32:19 -0800 (PST)
X-Gm-Message-State: APjAAAUeK+B2XscA5IdIjM6mps54k9YDrujLhBPHx3ik+jEZUDO+jnMP
 +5EXiP9KJlfeUD5XlYeOPDL4LNLywLDT6S68IAo=
X-Google-Smtp-Source: APXvYqxHsEfuc15QccYYoO3mMIzjxvsZyJ8NndbXzj8xZY5U5/pnCU+/GNZ3HULnsNBhOpZLL9mXQxUwQCyitsE4S0s=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr10472378uau.109.1582047137946; 
 Tue, 18 Feb 2020 09:32:17 -0800 (PST)
MIME-Version: 1.0
References: <202002180512.4RU8Rxge%lkp@intel.com>
 <CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com>
In-Reply-To: <CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Feb 2020 02:31:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARh198oeSfM-u9c=s_tZ+V+Yhq58q6rMSU+iX0-q2GGLA@mail.gmail.com>
Message-ID: <CAK7LNARh198oeSfM-u9c=s_tZ+V+Yhq58q6rMSU+iX0-q2GGLA@mail.gmail.com>
Subject: Re: "imply" and modular target dependencies (was: Re: [asoc:for-5.7
 21/76] wcd9335.c:undefined reference to `slim_stream_prepare')
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: multipart/mixed; boundary="000000000000acff26059edd0d37"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
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

--000000000000acff26059edd0d37
Content-Type: text/plain; charset="UTF-8"

Hi Geert,


On Tue, Feb 18, 2020 at 11:13 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Mon, Feb 17, 2020 at 10:55 PM kbuild test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7
> > head:   3cd23f021e2e5f3350125abcb39f12430df87d06
> > commit: ea00d95200d02ece71f5814d41b14f2eb16d598b [21/76] ASoC: Use imply for SND_SOC_ALL_CODECS
> > config: x86_64-randconfig-s2-20200217 (attached as .config)
> > compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> > reproduce:
> >         git checkout ea00d95200d02ece71f5814d41b14f2eb16d598b
> >         # save the attached .config to linux build tree
> >         make ARCH=x86_64
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
>
> Thanks for your report!
>
> > All errors (new ones prefixed by >>):
> >
> >    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_read_reg':
> >    ab8500-codec.c:(.text+0x479): undefined reference to `abx500_get_register_interruptible'
> >    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_probe':
> >    ab8500-codec.c:(.text+0xdf1): undefined reference to `abx500_get_register_interruptible'
> >    ld: ab8500-codec.c:(.text+0xe18): undefined reference to `abx500_set_register_interruptible'
> >    ld: sound/soc/codecs/ab8500-codec.o: in function `ab8500_codec_write_reg':
> >    ab8500-codec.c:(.text+0x4b1): undefined reference to `abx500_set_register_interruptible'
>
> The above are fixed in next-20200218.
>
> >    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
> >    mc13783.c:(.text+0x24c): undefined reference to `mc13xxx_reg_write'
> >    ld: mc13783.c:(.text+0x25e): undefined reference to `mc13xxx_reg_write'
> >    ld: mc13783.c:(.text+0x270): undefined reference to `mc13xxx_reg_write'
> >    ld: mc13783.c:(.text+0x282): undefined reference to `mc13xxx_reg_write'
> >    ld: mc13783.c:(.text+0x294): undefined reference to `mc13xxx_reg_write'
> >    ld: sound/soc/codecs/mc13783.o:mc13783.c:(.text+0x2a6): more undefined references to `mc13xxx_reg_write' follow
> >    ld: sound/soc/codecs/mc13783.o: in function `mc13783_probe':
> >    mc13783.c:(.text+0x2c5): undefined reference to `mc13xxx_reg_rmw'
> >    ld: mc13783.c:(.text+0x2e4): undefined reference to `mc13xxx_reg_rmw'
> >    ld: sound/soc/codecs/mc13783.o: in function `mc13783_remove':
> >    mc13783.c:(.text+0x212): undefined reference to `mc13xxx_reg_rmw'
>
> CONFIG_SND_SOC_MC13783=y
> CONFIG_MFD_MC13XXX=m
>
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_trigger':
> > >> wcd9335.c:(.text+0x323): undefined reference to `slim_stream_prepare'
> > >> ld: wcd9335.c:(.text+0x32f): undefined reference to `slim_stream_enable'
> > >> ld: wcd9335.c:(.text+0x345): undefined reference to `slim_stream_unprepare'
> > >> ld: wcd9335.c:(.text+0x351): undefined reference to `slim_stream_disable'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_status':
> > >> wcd9335.c:(.text+0x1970): undefined reference to `of_slim_get_device'
> > >> ld: wcd9335.c:(.text+0x1995): undefined reference to `slim_get_logical_addr'
> > >> ld: wcd9335.c:(.text+0x19b2): undefined reference to `__regmap_init_slimbus'
> >    ld: wcd9335.c:(.text+0x19f3): undefined reference to `__regmap_init_slimbus'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_hw_params':
> > >> wcd9335.c:(.text+0x348f): undefined reference to `slim_stream_allocate'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_init':
> > >> wcd9335.c:(.init.text+0x3c): undefined reference to `__slim_driver_register'
> >    ld: sound/soc/codecs/wcd9335.o: in function `wcd9335_slim_driver_exit':
> > >> wcd9335.c:(.exit.text+0x8): undefined reference to `slim_driver_unregister'
>
> CONFIG_SND_SOC_WCD9335=y
> CONFIG_SLIMBUS=m
>
> >    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_trigger':
> > >> wcd934x.c:(.text+0x30d): undefined reference to `slim_stream_prepare'
> > >> ld: wcd934x.c:(.text+0x319): undefined reference to `slim_stream_enable'
> > >> ld: wcd934x.c:(.text+0x32f): undefined reference to `slim_stream_unprepare'
> > >> ld: wcd934x.c:(.text+0x33b): undefined reference to `slim_stream_disable'
> >    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_hw_params':
> > >> wcd934x.c:(.text+0x2620): undefined reference to `slim_stream_allocate'
> >    ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
> > >> wcd934x.c:(.text+0x27ee): undefined reference to `of_slim_get_device'
> > >> ld: wcd934x.c:(.text+0x2818): undefined reference to `slim_get_logical_addr'
> > >> ld: wcd934x.c:(.text+0x2836): undefined reference to `__regmap_init_slimbus'
>
> CONFIG_SND_SOC_WCD934X=y
> CONFIG_SLIMBUS=m
>
> All CONFIG_SND_SOC_* symbols above are tristate and have dependencies
> on the modular symbols.
>
> However, the "imply" statements in SND_SOC_ALL_CODECS force all of them
> builtin, despite their dependencies being modular.
>
> So while "imply" is meant to be a softer form of "select", obeying target
> dependencies, it does not seem to obey modular tristate dependencies?


I quickly checked the Kconfig code.

Surprisingly or not, 'imply' does not
obey 'depends on'.

I do not know if it is a bug, or intended behavior
but at least the current code works so.
(I am guessing this is a bug...)

I checked Documentation/kbuild/kconfig-language.rst
Unfortunately, this case is not documented.


        ===             ===             =============   ==============
        FOO             BAR             BAZ's default   choice for BAZ
        ===             ===             =============   ==============
        n               y               n               N/m/y
        m               y               m               M/y/n
        y               y               y               Y/n
        y               n               *               N
        y               m               <undocumented>  <undocumented>
        ===             ===             =============   ==============



I attached a patch, which changes the 'imply' to
follow the restriction of 'depends on',
but I need to take a closer look at this.





> Or am I missing something?
> Thanks!



-- 
Best Regards
Masahiro Yamada

--000000000000acff26059edd0d37
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-kconfig-change-imply-to-respect-depends-on.patch"
Content-Disposition: attachment; 
	filename="0001-kconfig-change-imply-to-respect-depends-on.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6s5j8630>
X-Attachment-Id: f_k6s5j8630

RnJvbSA0ZWM1NDJlMjAxOTAwYzBkZDFlMDZhNDljYTMwN2YwZmU5ZDJjNGNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PgpEYXRlOiBXZWQsIDE5IEZlYiAyMDIwIDAyOjE0OjQ4ICswOTAwClN1YmplY3Q6IFtQQVRDSF0g
a2NvbmZpZzogY2hhbmdlICdpbXBseScgdG8gcmVzcGVjdCAnZGVwZW5kcyBvbicKClNpZ25lZC1v
ZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Ci0tLQogc2NyaXB0
cy9rY29uZmlnL3N5bWJvbC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9zeW1i
b2wuYyBiL3NjcmlwdHMva2NvbmZpZy9zeW1ib2wuYwppbmRleCA4ZDM4YjcwMGIzMTQuLjQ1MDAz
ZDdkZmIwYSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5jCisrKyBiL3Njcmlw
dHMva2NvbmZpZy9zeW1ib2wuYwpAQCAtMzkzLDcgKzM5Myw5IEBAIHZvaWQgc3ltX2NhbGNfdmFs
dWUoc3RydWN0IHN5bWJvbCAqc3ltKQogCQkJCX0KIAkJCQlpZiAoc3ltLT5pbXBsaWVkLnRyaSAh
PSBubykgewogCQkJCQlzeW0tPmZsYWdzIHw9IFNZTUJPTF9XUklURTsKLQkJCQkJbmV3dmFsLnRy
aSA9IEVYUFJfT1IobmV3dmFsLnRyaSwgc3ltLT5pbXBsaWVkLnRyaSk7CisJCQkJCW5ld3ZhbC50
cmkgPSBFWFBSX09SKG5ld3ZhbC50cmksCisJCQkJCQkJICAgICBFWFBSX0FORChzeW0tPmRpcl9k
ZXAudHJpLAorCQkJCQkJCQkgICAgICBzeW0tPmltcGxpZWQudHJpKSk7CiAJCQkJfQogCQkJfQog
CQljYWxjX25ld3ZhbDoKQEAgLTQwMSw4ICs0MDMsNyBAQCB2b2lkIHN5bV9jYWxjX3ZhbHVlKHN0
cnVjdCBzeW1ib2wgKnN5bSkKIAkJCQlzeW1fd2Fybl91bm1ldF9kZXAoc3ltKTsKIAkJCW5ld3Zh
bC50cmkgPSBFWFBSX09SKG5ld3ZhbC50cmksIHN5bS0+cmV2X2RlcC50cmkpOwogCQl9Ci0JCWlm
IChuZXd2YWwudHJpID09IG1vZCAmJgotCQkgICAgKHN5bV9nZXRfdHlwZShzeW0pID09IFNfQk9P
TEVBTiB8fCBzeW0tPmltcGxpZWQudHJpID09IHllcykpCisJCWlmIChuZXd2YWwudHJpID09IG1v
ZCAmJiBzeW1fZ2V0X3R5cGUoc3ltKSA9PSBTX0JPT0xFQU4pCiAJCQluZXd2YWwudHJpID0geWVz
OwogCQlicmVhazsKIAljYXNlIFNfU1RSSU5HOgotLSAKMi4xNy4xCgo=
--000000000000acff26059edd0d37--
