Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C244C9A11B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 22:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0135A165D;
	Thu, 22 Aug 2019 22:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0135A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566505945;
	bh=s9S82JgtgDRr1/SCpb4YNw6SfudOCmbpo8nhSE/LuV4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hywnW7/rfgmnHTItsr0a4lq4C9plSjTj41nk42O5mTXn4s9HAFY32u8oPIIEjOgy4
	 iVYOw2pW/M7i1Sp8azW7EjYPFOv+sPlnORjlm4/KPR6Tdd36WcnlsYpwMnL7PT6YMW
	 lcNr+dhyeVdN6QUCxurAyKOuVo+tGMgvufn8iwqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3298F80391;
	Thu, 22 Aug 2019 22:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E56B3F8036E; Thu, 22 Aug 2019 22:30:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 47DEFF80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 22:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DEFF80147
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id 6BAC7206E1C0; Thu, 22 Aug 2019 22:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su 6BAC7206E1C0
Date: Thu, 22 Aug 2019 22:30:31 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190822203031.GA22363@xn--80adja5bqm.su>
References: <20190404192430.GA24729@xn--80adja5bqm.su>
 <20190719111231.GA26592@xn--80adja5bqm.su>
 <s5hzhla9j8b.wl-tiwai@suse.de>
 <20190720165435.GA5855@xn--80adja5bqm.su>
 <20190819195714.GA2737@xn--80adja5bqm.su>
 <s5hef1dthbk.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <s5hef1dthbk.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Surround speaker connection on Acer 8951G
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


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

On Thu, Aug 22, 2019 at 04:17:51PM +0200, Takashi Iwai wrote:
> > I am going at a slow pace, but I did not give up and I'd be happy if you or
> > anyone else from the list would find the time to answer some questions from 
> > time to time.
> > 
> > Right now I am mostly studying patch_realtek.c, as a first step I want to
> > make sure that at least my known pins get set up by the driver without
> > having to go via hdajackretask.
> > 
> > I got my build set up, I also dug up hda-decode-pincfg from the hda-emu
> > sources and made it compile (very useful if one wants to understand and
> > compare the pin configurations in patch_realtek.c), so now I am trying
> > things out every other evening.
> > 
> > One part that is not quite clear to me: what the heck is ALC669X?
> 
> It's just a name string :)  Realtek seems to give a different chip
> name for the certain variant for Dell or whatever big vendors.
> AFAIK, basically it's the very same chip as ALC670, which is almost
> compatible with ALC662 variant.

Oh, OK, that explains why I was not able to find any real "connection"
to this entry in the code, I was searching for a deeper meaning there :)
 
> > Could someone please explain the meaning of alc_codec_rename_pci_table ?
> > 
> > Entry for my vendor id looks like this:
> >     { 0x10ec0670, 0x1025, 0, "ALC669X" },
> > 
> > If I search for that vendor id further in the code, I see that it gets
> > patched as ALC662?
> > 
> >     HDA_CODEC_ENTRY(0x10ec0670, "ALC670", patch_alc662),
> > 
> > At the same time the documentation in models.rst lists those numbers
> > together:
> > 
> > ALC66x/67x/892
> > 
> > I already looked at the hda-audio specification from Intel to get a general
> > understanding, but I was also pulling some Realtek specs which do describe
> > implemented verbs and things like that (my hope was to see something
> > vendor related which could hint me how to enable the subwoofer).
> > 
> > I was not able to find any 669 Realtek datasheets, I did however find
> > the ones for ALC665 and ALC892. How specific is all of this, i.e. should I
> > keep looking for the exact one or am I on the wrong path here?
> 
> The datasheet of ALC662 and similar chips should be available.
> In general, there is no big difference among Realtek chips; one has
> more I/O pins available, while one has less.
> 
> The vendor-specific stuff like COEF isn't found in the datasheet in
> details, unfortunately.  Also, the GPIO pin connection isn't covered
> by the codec datasheet, as it's rather device-specific, of course.

Doh... there go my hopes for finding an easy answer... thank you for
clarifying that.

As mentioned earlier, I will leave the "subwoofer battle" for the very
end.

For starters I added the pin configuration for the Acer Aspire 8951G
Ethos to enable surround speakers (without the subwoofer for now).

Not sure how it happened, but since yesterday I lost the ability to
unload the module at runtime and I was not able to find out what is using
it, so debugging has become a pain now :P

Next thing I am looking at is the problem with automute when HP are plugged in,
I hope you can point me in the right direction here.

As described in one of my earlier posts, rear speakers share the pin with 
the headphones jack and they get correctly muted when headphones are plugged in.

However, all other speakers (front, center) remain unmuted.

I was trying to figure out how to approach this, but did not really
get anywhere.

My first idea was to go with the automute hook, however it did not
behave the way I would expect it: for some reason it is not triggering
on the HP jack, it is however triggering on mic-in and line-out jacks.

I kept the "misc" bit on zero, which  means jack-detect is possible, and I set
port connectivity to 11b (Both a jack and an internal device are attached).

So if I understood the spec correctly, then this configuration should be
appropriate: 0xd1130012 ?

Its worth mentioning, that hdajacksensetest -a will show presence detection
correctly.

Assuming that I figure out how to get the auto mute hook to trigger on the
HP jack, next question would be: what to do in the hook?

I tried to understand existing hooks, but did not really get anywhere.
A lot of them are doing something with VREF80, which seems to be some
voltage setting.. but how would that be related to muting?

Could you please hint how to approach this? Am I supposed to mute/unmute
the remaining speakers (pins) individually?

I am attaching what I have so far as reference, currently I am hacking
vs a Fedora 29 5.2.7-100.fc29.x86_64 kernel (it's just easier to get started
like that), I will submit a proper patch when we get this to work properly :>

Kind regards,
Jin


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="acer8951g_ethos.patch"

--- patch_realtek.c	2019-08-13 21:40:03.786677925 +0300
+++ patch_realtek.c	2019-08-22 23:21:33.425060594 +0300
@@ -8256,6 +8256,21 @@
 	}
 }
 
+static void alc662_aspire_ethos_automute_hook(struct hda_codec *codec,
+					 struct hda_jack_callback *jack)
+{
+	struct alc_spec *spec = codec->spec;
+	printk("AUTOMUTE HOOK: jack presence %d\n", spec->gen.hp_jack_present);
+}
+
+static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->gen.hp_automute_hook = alc662_aspire_ethos_automute_hook;
+	}
+}
 static struct coef_fw alc668_coefs[] = {
 	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
 	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
@@ -8327,6 +8342,8 @@
 	ALC662_FIXUP_USI_FUNC,
 	ALC662_FIXUP_USI_HEADSET_MODE,
 	ALC662_FIXUP_LENOVO_MULTI_CODECS,
+	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
+	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -8653,6 +8670,22 @@
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_alc662_fixup_lenovo_dual_codecs,
 	},
+	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc662_fixup_aspire_ethos_hp,
+	},
+	[ALC669_FIXUP_ACER_ASPIRE_ETHOS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x15, 0x92130110 }, /* internal speakers front left/right */
+			{ 0x18, 0x99130111 }, /* internal speaker center */
+			{ 0x1b, 0xd1130012 }, /* internal speakers rear plus HP out */
+			{ 0x19, 0x13a10023 }, /* external microphone jack */
+			{ }
+		},
+        .chained = true,
+        .chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
+	},
 };
 
 static const struct snd_pci_quirk alc662_fixup_tbl[] = {
@@ -8698,6 +8731,7 @@
 	SND_PCI_QUIRK(0x19da, 0xa130, "Zotac Z68", ALC662_FIXUP_ZOTAC_Z68),
 	SND_PCI_QUIRK(0x1b0a, 0x01b8, "ACER Veriton", ALC662_FIXUP_ACER_VERITON),
 	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
+	SND_PCI_QUIRK(0x1025, 0x0566, "Acer Aspire 8951G", ALC669_FIXUP_ACER_ASPIRE_ETHOS),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
@@ -8791,6 +8825,7 @@
 	{.id = ALC892_FIXUP_ASROCK_MOBO, .name = "asrock-mobo"},
 	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
 	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
 	{}
 };
 

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--y0ulUmNC+osPPQO6--
