Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9C4F3A37
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 16:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5E41700;
	Tue,  5 Apr 2022 16:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5E41700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649170769;
	bh=ftoayH4w0WjaPRRerFzfbVHvxVPFkiejmOlJJD0U2Z4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVf1fqWUyaNDv7q8NawAfxGjrZDe5EWrdC6tr9DsQGIt90MafazcE2t+QqlkgLhPi
	 P7KONHEV0/cDzxs7r9E1EN164IdkFv0JnGSnFG0JwhxDL2L086bqmq8oXNb6/bo+wV
	 5ICytafh5FeIIf6WPAs9MUJFRWQwfY/j37Do0Eww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A196DF8016B;
	Tue,  5 Apr 2022 16:58:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C0CCF8016A; Tue,  5 Apr 2022 16:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAFEDF800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 16:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAFEDF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fWFrOD3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649170707; x=1680706707;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=ftoayH4w0WjaPRRerFzfbVHvxVPFkiejmOlJJD0U2Z4=;
 b=fWFrOD3Jihzp0RXVLhIgxCyYHxsBXUdVKaN6gEv27O9L4OJ7VnWWmOZD
 sxOUm8U9tkr2MWsEnZGyxbBAPqIaqzglu4moDdm+VnsH+yLUlF6bmfxBU
 XMmd4h7WNBYJZA7Mf9+7GyI9BiWmIXmvleATOC3ZgNb5GogV8h7kMPZD1
 Rc02aqH49bqNnhWI7vvNyMZgIYw4vuZvA1hU4t58iYnZtCe9Olplz83Oc
 YKDFvVFBGpzw2R5yCFnwrpCmLIeZM8q7SzFXDyvFE3ePf5sKwD0hm69ji
 OQ10mO1W9jg7PAd2JMSGcGIqnckF1DEe8/Zw3k/0t38fyPjLQj3zEccxS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="240703167"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
 d="scan'208,223";a="240703167"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:58:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
 d="scan'208,223";a="651919363"
Received: from ctveazey-mobl2.amr.corp.intel.com (HELO [10.255.230.126])
 ([10.255.230.126])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:58:19 -0700
Content-Type: multipart/mixed; boundary="------------ClSbdupNyf17Jgy0oUfwGd0u"
Message-ID: <5df9bb3c-2346-f465-fcae-eb6fe381def3@linux.intel.com>
Date: Tue, 5 Apr 2022 09:57:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] ASoC: Intel: sof_es8336: support a separate gpio
 to control headphone
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1649147890.git.mchehab@kernel.org>
 <0f1e8233fc6744c3d78353e4a20f9669035e693d.1649147890.git.mchehab@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0f1e8233fc6744c3d78353e4a20f9669035e693d.1649147890.git.mchehab@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

This is a multi-part message in MIME format.
--------------ClSbdupNyf17Jgy0oUfwGd0u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/5/22 03:44, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> Some devices may use both gpio0 and gpio1 to independently switch
> the speaker and the headphone.
> 
> Add support for that.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1649147890.git.mchehab@kernel.org/
> 
>   sound/soc/intel/boards/sof_es8336.c | 60 ++++++++++++++++++++++++-----
>   1 file changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
> index 5e0529aa4f1d..bcd80870d252 100644
> --- a/sound/soc/intel/boards/sof_es8336.c
> +++ b/sound/soc/intel/boards/sof_es8336.c
> @@ -30,6 +30,7 @@
>   #define SOF_ES8336_TGL_GPIO_QUIRK		BIT(4)
>   #define SOF_ES8336_ENABLE_DMIC			BIT(5)
>   #define SOF_ES8336_JD_INVERTED			BIT(6)
> +#define SOF_ES8336_HEADPHONE_GPIO		BIT(7)
>   
>   static unsigned long quirk;
>   
> @@ -39,7 +40,7 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
>   
>   struct sof_es8336_private {
>   	struct device *codec_dev;
> -	struct gpio_desc *gpio_pa;
> +	struct gpio_desc *gpio_pa, *gpio_pa_headphone;
>   	struct snd_soc_jack jack;
>   	struct list_head hdmi_pcm_list;
>   	bool speaker_en;
> @@ -51,15 +52,28 @@ struct sof_hdmi_pcm {
>   	int device;
>   };
>   
> -static const struct acpi_gpio_params pa_enable_gpio = { 0, 0, true };
> +static const struct acpi_gpio_params pa_enable_gpio0 = { 0, 0, true };
> +static const struct acpi_gpio_params pa_enable_gpio1 = { 1, 0, true };
> +
>   static const struct acpi_gpio_mapping acpi_es8336_gpios[] = {
> -	{ "pa-enable-gpios", &pa_enable_gpio, 1 },
> +	{ "pa-enable-gpios", &pa_enable_gpio0, 1 },
>   	{ }
>   };
>   
> -static const struct acpi_gpio_params quirk_pa_enable_gpio = { 1, 0, true };
>   static const struct acpi_gpio_mapping quirk_acpi_es8336_gpios[] = {
> -	{ "pa-enable-gpios", &quirk_pa_enable_gpio, 1 },
> +	{ "pa-enable-gpios", &pa_enable_gpio1, 1 },
> +	{ }
> +};
> +
> +static const struct acpi_gpio_mapping quirk_acpi_headphone_es8336_gpios[] = {
> +	{ "pa-enable-gpios", &pa_enable_gpio0, 1 },
> +	{ "pa-enable-headphone-gpios", &pa_enable_gpio1, 1 },
> +	{ }
> +};
> +
> +static const struct acpi_gpio_mapping quirk_tgl_acpi_headphone_es8336_gpios[] = {
> +	{ "pa-enable-gpios", &pa_enable_gpio1, 1 },
> +	{ "pa-enable-headphone-gpios", &pa_enable_gpio0, 1 },
>   	{ }

This is starting to be a bit messy, the initial gpios were really 
intended for speakers and should be clearly referring to speakers now. 
the TGL quirk really means gpio1 is used instead of gpio0, and I can't 
figure out what the 'pa' prefix is needed for.

Can I suggest the attached cleanup patch be added first? That would make 
it clearer and more readable IMHO. Compile-tested only since I don't 
have hardware.

Thanks!

--------------ClSbdupNyf17Jgy0oUfwGd0u
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ASoC-Intel-sof_es8336-simplify-speaker-gpio-naming.patch"
Content-Disposition: attachment;
 filename*0="0001-ASoC-Intel-sof_es8336-simplify-speaker-gpio-naming.patc";
 filename*1="h"
Content-Transfer-Encoding: base64

RnJvbSBmM2Q3MTQ0ZDU1MzM0OWY4MDdmYmZlMDc1NWFlZmE5YWMwNGE2ODhjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxv
dWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgpEYXRlOiBUdWUsIDUgQXByIDIwMjIgMDk6
NDc6MTMgLTA1MDAKU3ViamVjdDogW1BBVENIXSBBU29DOiBJbnRlbDogc29mX2VzODMzNjog
c2ltcGxpZnkgc3BlYWtlciBncGlvIG5hbWluZwoKSW4gcHJlcGFyYXRpb24gZm9yIHRoZSBz
dXBwb3J0IG9mIGFuIGFkZGl0aW9uYWwgZ3BpbyBmb3IgaGVhZHBob25lCmNvbnRyb2wsIHJl
bmFtZSBHUElPcyB0byBtYWtlIGV4cGxpY2l0IHJlZmVyZW5jZXMgdG8gc3BlYWtlcnMgYW5k
CmdwaW8wIG9yIGdwaW8xLgoKTm8gZnVuY3Rpb25hbGl0eSBjaGFuZ2UuCgpTaWduZWQtb2Zm
LWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXgu
aW50ZWwuY29tPgotLS0KIHNvdW5kL3NvYy9pbnRlbC9ib2FyZHMvc29mX2VzODMzNi5jIHwg
NDIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
aW50ZWwvYm9hcmRzL3NvZl9lczgzMzYuYyBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvc29m
X2VzODMzNi5jCmluZGV4IDVlMDUyOWFhNGYxZC4uNGJkODE5ZDc1Y2YyIDEwMDY0NAotLS0g
YS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9lczgzMzYuYworKysgYi9zb3VuZC9zb2Mv
aW50ZWwvYm9hcmRzL3NvZl9lczgzMzYuYwpAQCAtMjcsNyArMjcsNyBAQAogI2RlZmluZSBT
T0ZfRVM4MzM2X1NTUF9DT0RFQyhxdWlyaykJCSgocXVpcmspICYgR0VOTUFTSygzLCAwKSkK
ICNkZWZpbmUgU09GX0VTODMzNl9TU1BfQ09ERUNfTUFTSwkJKEdFTk1BU0soMywgMCkpCiAK
LSNkZWZpbmUgU09GX0VTODMzNl9UR0xfR1BJT19RVUlSSwkJQklUKDQpCisjZGVmaW5lIFNP
Rl9FUzgzMzZfU1BFQUtFUlNfRU5fR1BJTzFfUVVJUksJCUJJVCg0KQogI2RlZmluZSBTT0Zf
RVM4MzM2X0VOQUJMRV9ETUlDCQkJQklUKDUpCiAjZGVmaW5lIFNPRl9FUzgzMzZfSkRfSU5W
RVJURUQJCQlCSVQoNikKIApAQCAtMzksNyArMzksNyBAQCBNT0RVTEVfUEFSTV9ERVNDKHF1
aXJrLCAiQm9hcmQtc3BlY2lmaWMgcXVpcmsgb3ZlcnJpZGUiKTsKIAogc3RydWN0IHNvZl9l
czgzMzZfcHJpdmF0ZSB7CiAJc3RydWN0IGRldmljZSAqY29kZWNfZGV2OwotCXN0cnVjdCBn
cGlvX2Rlc2MgKmdwaW9fcGE7CisJc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb19zcGVha2VyczsK
IAlzdHJ1Y3Qgc25kX3NvY19qYWNrIGphY2s7CiAJc3RydWN0IGxpc3RfaGVhZCBoZG1pX3Bj
bV9saXN0OwogCWJvb2wgc3BlYWtlcl9lbjsKQEAgLTUxLDE5ICs1MSwxOSBAQCBzdHJ1Y3Qg
c29mX2hkbWlfcGNtIHsKIAlpbnQgZGV2aWNlOwogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVj
dCBhY3BpX2dwaW9fcGFyYW1zIHBhX2VuYWJsZV9ncGlvID0geyAwLCAwLCB0cnVlIH07Ci1z
dGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZ3Bpb19tYXBwaW5nIGFjcGlfZXM4MzM2X2dwaW9z
W10gPSB7Ci0JeyAicGEtZW5hYmxlLWdwaW9zIiwgJnBhX2VuYWJsZV9ncGlvLCAxIH0sCitz
dGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZ3Bpb19wYXJhbXMgc3BlYWtlcnNfZW5hYmxlX2dw
aW8wID0geyAwLCAwLCB0cnVlIH07CitzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZ3Bpb19t
YXBwaW5nIGFjcGlfc3BlYWtlcnNfZW5hYmxlX2dwaW8wW10gPSB7CisJeyAic3BlYWtlcnMt
ZW5hYmxlLWdwaW9zIiwgJnNwZWFrZXJzX2VuYWJsZV9ncGlvMCwgMSB9LAogCXsgfQogfTsK
IAotc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2dwaW9fcGFyYW1zIHF1aXJrX3BhX2VuYWJs
ZV9ncGlvID0geyAxLCAwLCB0cnVlIH07Ci1zdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZ3Bp
b19tYXBwaW5nIHF1aXJrX2FjcGlfZXM4MzM2X2dwaW9zW10gPSB7Ci0JeyAicGEtZW5hYmxl
LWdwaW9zIiwgJnF1aXJrX3BhX2VuYWJsZV9ncGlvLCAxIH0sCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFjcGlfZ3Bpb19wYXJhbXMgc3BlYWtlcnNfZW5hYmxlX2dwaW8xID0geyAxLCAwLCB0
cnVlIH07CitzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZ3Bpb19tYXBwaW5nIGFjcGlfc3Bl
YWtlcnNfZW5hYmxlX2dwaW8xW10gPSB7CisJeyAic3BlYWtlcnMtZW5hYmxlLWdwaW9zIiwg
JnNwZWFrZXJzX2VuYWJsZV9ncGlvMSwgMSB9LAogCXsgfQogfTsKIAotc3RhdGljIGNvbnN0
IHN0cnVjdCBhY3BpX2dwaW9fbWFwcGluZyAqZ3Bpb19tYXBwaW5nID0gYWNwaV9lczgzMzZf
Z3Bpb3M7CitzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZ3Bpb19tYXBwaW5nICpncGlvX21h
cHBpbmcgPSBhY3BpX3NwZWFrZXJzX2VuYWJsZV9ncGlvMDsKIAogc3RhdGljIHZvaWQgbG9n
X3F1aXJrcyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CkBAIC03MSw4ICs3MSw4IEBAIHN0YXRp
YyB2b2lkIGxvZ19xdWlya3Moc3RydWN0IGRldmljZSAqZGV2KQogCWRldl9pbmZvKGRldiwg
InF1aXJrIFNTUCVsZFxuIiwgIFNPRl9FUzgzMzZfU1NQX0NPREVDKHF1aXJrKSk7CiAJaWYg
KHF1aXJrICYgU09GX0VTODMzNl9FTkFCTEVfRE1JQykKIAkJZGV2X2luZm8oZGV2LCAicXVp
cmsgRE1JQyBlbmFibGVkXG4iKTsKLQlpZiAocXVpcmsgJiBTT0ZfRVM4MzM2X1RHTF9HUElP
X1FVSVJLKQotCQlkZXZfaW5mbyhkZXYsICJxdWlyayBUR0wgR1BJTyBlbmFibGVkXG4iKTsK
KwlpZiAocXVpcmsgJiBTT0ZfRVM4MzM2X1NQRUFLRVJTX0VOX0dQSU8xX1FVSVJLKQorCQlk
ZXZfaW5mbyhkZXYsICJTcGVha2VycyBHUElPMSBxdWlyayBlbmFibGVkXG4iKTsKIAlpZiAo
cXVpcmsgJiBTT0ZfRVM4MzM2X0pEX0lOVkVSVEVEKQogCQlkZXZfaW5mbyhkZXYsICJxdWly
ayBKRCBpbnZlcnRlZCBlbmFibGVkXG4iKTsKIH0KQEAgLTg4LDcgKzg4LDcgQEAgc3RhdGlj
IGludCBzb2ZfZXM4MzE2X3NwZWFrZXJfcG93ZXJfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFw
bV93aWRnZXQgKncsCiAJZWxzZQogCQlwcml2LT5zcGVha2VyX2VuID0gdHJ1ZTsKIAotCWdw
aW9kX3NldF92YWx1ZV9jYW5zbGVlcChwcml2LT5ncGlvX3BhLCBwcml2LT5zcGVha2VyX2Vu
KTsKKwlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAocHJpdi0+Z3Bpb19zcGVha2VycywgcHJp
di0+c3BlYWtlcl9lbik7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTIzMyw4ICsyMzMsOCBAQCBz
dGF0aWMgaW50IHNvZl9lczgzMzZfcXVpcmtfY2IoY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1f
aWQgKmlkKQogewogCXF1aXJrID0gKHVuc2lnbmVkIGxvbmcpaWQtPmRyaXZlcl9kYXRhOwog
Ci0JaWYgKHF1aXJrICYgU09GX0VTODMzNl9UR0xfR1BJT19RVUlSSykKLQkJZ3Bpb19tYXBw
aW5nID0gcXVpcmtfYWNwaV9lczgzMzZfZ3Bpb3M7CisJaWYgKHF1aXJrICYgU09GX0VTODMz
Nl9TUEVBS0VSU19FTl9HUElPMV9RVUlSSykKKwkJZ3Bpb19tYXBwaW5nID0gYWNwaV9zcGVh
a2Vyc19lbmFibGVfZ3BpbzE7CiAKIAlyZXR1cm4gMTsKIH0KQEAgLTI1Nyw3ICsyNTcsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgc29mX2VzODMzNl9xdWlya190
YWJsZVtdID0gewogCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiSVAzIHRlY2giKSwK
IAkJCURNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIldOMSIpLAogCQl9LAotCQkuZHJpdmVy
X2RhdGEgPSAodm9pZCAqKShTT0ZfRVM4MzM2X1RHTF9HUElPX1FVSVJLKQorCQkuZHJpdmVy
X2RhdGEgPSAodm9pZCAqKShTT0ZfRVM4MzM2X1NQRUFLRVJTX0VOX0dQSU8xX1FVSVJLKQog
CX0sCiAJe30KIH07CkBAIC01ODUsMTAgKzU4NSwxMCBAQCBzdGF0aWMgaW50IHNvZl9lczgz
MzZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlk
ZXZfd2Fybihjb2RlY19kZXYsICJ1bmFibGUgdG8gYWRkIEdQSU8gbWFwcGluZyB0YWJsZVxu
Iik7CiAKLQlwcml2LT5ncGlvX3BhID0gZ3Bpb2RfZ2V0X29wdGlvbmFsKGNvZGVjX2Rldiwg
InBhLWVuYWJsZSIsIEdQSU9EX09VVF9MT1cpOwotCWlmIChJU19FUlIocHJpdi0+Z3Bpb19w
YSkpIHsKLQkJcmV0ID0gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+Z3Bpb19w
YSksCi0JCQkJICAgICJjb3VsZCBub3QgZ2V0IHBhLWVuYWJsZSBHUElPXG4iKTsKKwlwcml2
LT5ncGlvX3NwZWFrZXJzID0gZ3Bpb2RfZ2V0X29wdGlvbmFsKGNvZGVjX2RldiwgInNwZWFr
ZXJzLWVuYWJsZSIsIEdQSU9EX09VVF9MT1cpOworCWlmIChJU19FUlIocHJpdi0+Z3Bpb19z
cGVha2VycykpIHsKKwkJcmV0ID0gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+
Z3Bpb19zcGVha2VycyksCisJCQkJICAgICJjb3VsZCBub3QgZ2V0IHNwZWFrZXJzLWVuYWJs
ZSBHUElPXG4iKTsKIAkJZ290byBlcnJfcHV0X2NvZGVjOwogCX0KIApAQCAtNjA0LDcgKzYw
NCw3IEBAIHN0YXRpYyBpbnQgc29mX2VzODMzNl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCiAJcmV0ID0gZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NhcmQoZGV2LCBj
YXJkKTsKIAlpZiAocmV0KSB7Ci0JCWdwaW9kX3B1dChwcml2LT5ncGlvX3BhKTsKKwkJZ3Bp
b2RfcHV0KHByaXYtPmdwaW9fc3BlYWtlcnMpOwogCQlkZXZfZXJyKGRldiwgInNuZF9zb2Nf
cmVnaXN0ZXJfY2FyZCBmYWlsZWQ6ICVkXG4iLCByZXQpOwogCQlnb3RvIGVycl9wdXRfY29k
ZWM7CiAJfQpAQCAtNjIyLDcgKzYyMiw3IEBAIHN0YXRpYyBpbnQgc29mX2VzODMzNl9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3Qgc25kX3NvY19jYXJk
ICpjYXJkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHNvZl9lczgz
MzZfcHJpdmF0ZSAqcHJpdiA9IHNuZF9zb2NfY2FyZF9nZXRfZHJ2ZGF0YShjYXJkKTsKIAot
CWdwaW9kX3B1dChwcml2LT5ncGlvX3BhKTsKKwlncGlvZF9wdXQocHJpdi0+Z3Bpb19zcGVh
a2Vycyk7CiAJZGV2aWNlX3JlbW92ZV9zb2Z0d2FyZV9ub2RlKHByaXYtPmNvZGVjX2Rldik7
CiAJcHV0X2RldmljZShwcml2LT5jb2RlY19kZXYpOwogCi0tIAoyLjMwLjIKCg==

--------------ClSbdupNyf17Jgy0oUfwGd0u--
