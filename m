Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60288B4C66
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2024 17:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13F07B76;
	Sun, 28 Apr 2024 17:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13F07B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714318466;
	bh=lAdyF9C/e2KNbvsWr1J5VmDP7l6N1dbBgMqOcKbi7EE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gidiFYMuR/y/+P1ioTB8wgt9aicCqJ/lC+ObEp0yrSSakDe8zBwAAdku2vV9oWwgt
	 yIWurXWqaEGLPHa4lgxTOhyjAsyi8ICg++2/cmHfXqNb/zujAYyk32O8A4MWl1VHkQ
	 N17sUlQLYIAMMimwxVB6EN+QKdZPZE5ganAXtuWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9A3BF80579; Sun, 28 Apr 2024 17:33:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A606F8059F;
	Sun, 28 Apr 2024 17:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C9EAF8028D; Sun, 28 Apr 2024 17:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74587F8003C
	for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2024 17:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74587F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KM09uaf9
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34c8f393195so1162062f8f.0
        for <alsa-devel@alsa-project.org>;
 Sun, 28 Apr 2024 08:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714318259; x=1714923059;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMTV3xU4yc9K0nQyO0gVgRVc9t4un6W7+V1vXXeKhGQ=;
        b=KM09uaf9JQaauFT7z+Fwtzl9abOVsVwKwk9lyGYtppm52HVLfd/AwDYD5D4wiCxW/J
         6Cvb7PM+CAnCgasmh17yy3s0LsoEEsgdCE6FiObIbFOMtrGDWTSM/xtZckkQ4pnvRx1+
         jFVpq9qr5QZutkxzpEO9gDzetQ9M83jwMtlY1/22oSI5YHT2NbNVvlYLqkS5hjgQOyZD
         gglDzlmMrIn2K+kcwsX9k649eWdRjx/KWplTI1jQpQCbC7zPtwaIfEGCgDpQckdQQesU
         ptMbeLnSG2f1H0AvQ/H3p+3DVlxNnY1DGt8l2poDioCs/KQAIQud3N/zfpYVdtEvbITi
         pHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714318259; x=1714923059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMTV3xU4yc9K0nQyO0gVgRVc9t4un6W7+V1vXXeKhGQ=;
        b=A2s1LPKAvmUZ4QO+rhqnnyFZ1ilrohzqP/dTuXQiOIzBzlEHP8qN2NMqsVLOD+Xy/N
         JrLlD7WsZPaVHzkq08q9V427t9hoZNZNjuzKaIsZTdAUw8/i1AZJ2d6ONumpBnQqExE6
         A4apydTSYmNFEGjIMA2CxIHRB5K4CpRQHH84n64S5mqDD4h7PQgC9PIG3P6IxY8DuC7g
         mQLo8ddFDX7g1DUoFAzAOqRmdVVy+59CtoA4UwzvK3IKV2RzbjvYJa/qUJ1mYzgjHdq+
         ARRGjsXJvzxANGn5gk+5xwfVZcUe4LCH/dAkUlXIfC8zFdu91FYvdE8TB2w6lDQrSv1x
         5Tlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkfAleBd0bQq19IVbWrljfhsqeHm4uJmdDXnB3jCAsMeHApwTy4x3mtZCa7wQWt3uf8GLv7pILoW+BepoU+4En6mQag6DScfHm3us=
X-Gm-Message-State: AOJu0YybIWTYV45+/kXqdembi5EtxtdGiLNC5rw+kZv+7SeXjFT1+ekE
	9Kpv0jR56wnt5wWeIBupu6Gxed1KxZgI08LXLctKYSZRsGMhzQefVNYbvFpf5i2/Itb8bkjeKc6
	JiZpgI/9+fPnmkpnRkrlcjQIykOI=
X-Google-Smtp-Source: 
 AGHT+IEyoLOE3V4IavblSRhUH7RhbYCfLdBTOhqWHPaaskMcMrE+AMmS0fRAnMEx9Col2XGiO/CIf5mQykbSHlnuAiI=
X-Received: by 2002:a05:6000:11d0:b0:34d:118f:21ee with SMTP id
 i16-20020a05600011d000b0034d118f21eemr327836wrx.28.1714318259281; Sun, 28 Apr
 2024 08:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
 <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
In-Reply-To: <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
From: Chris Wulff <crwulff@gmail.com>
Date: Sun, 28 Apr 2024 11:30:47 -0400
Message-ID: 
 <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Felipe Balbi <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Julian Scheel <julian@jusst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>,
	AKASH KUMAR <quic_akakum@quicinc.com>, Jack Pham <jackp@codeaurora.org>,
	Chris Wulff <Chris.Wulff@biamp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YK3IYLTU5VL6FGMMDMHUFP6KQLQH3MMB
X-Message-ID-Hash: YK3IYLTU5VL6FGMMDMHUFP6KQLQH3MMB
X-MailFrom: crwulff@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YK3IYLTU5VL6FGMMDMHUFP6KQLQH3MMB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pavel,

  Following up on this and discussions in this patch series

https://lore.kernel.org/linux-usb/CO1PR17MB54195BE778868AFDFE2DCB36E1112@CO=
1PR17MB5419.namprd17.prod.outlook.com/

Example from that thread with c_alt_name changed to c_name as it lives
in an "alt.x" directory
and removal of the num_alt_modes in favor of just allowing "mkdir
alt.x" to create new alt mode
settings:

(all existing properties + the following new properties)
c_it_name
c_it_ch_name
c_fu_name
c_ot_name
p_it_name
p_it_ch_name
p_fu_name
p_ot_name

alt.0
  c_name
  p_name
alt.1 (for alt.1, alt.2, etc.)
  c_name
  p_name
  c_ssize
  p_ssize
  (Additional properties here for other things that are settable for
each alt mode,
   but the only one I've implemented in my prototype so far is sample size.=
)


Here is a more detailed breakdown of the (current) proposal:

* Allow the user to create "alt.x" directories inside uac1 and uac2
function configfs
  * Prior to creation of any of these alt.x subdirectories, the
function behaves the same
    as it does today. No "alt.x" directories would exist on creation
of the function.
  * Creation of "alt.0" contains only "c_name" and "p_name" to set the
USB string name
     for this alt mode, with the defaults as "Capture Inactive" and
"Playback Inactive"
  * Creation of "alt.x" where x is an integer, contains the same name
strings but
     with defaults of "Capture Active" and "Playback Active" and
additional files
     for any per-alt-mode configurable settings (such as c_ssize, p_ssize, =
etc.)
     At the time of creation, values for those are copied from the
corresponding settings
     in the function main configfs directory.
  * Creation of "alt.1" in particular changes the meaning of the files
in the main
     function configfs dir so that they are only _default_ values used
when creating
     "alt.x" directories and settings from "alt.1" will now be used
for alt mode 1.
     (Alt mode 1 always exists, even when "alt.1" has not been created.)

* ALSA card interface behavior
  * Configuration of the ALSA card interface remains the same. It is config=
ured
    when binding the function to match the settings in the main
function configfs.
    "alt.x" settings have no effect on the created ALSA card setup
  * Sample size will be converted between ALSA and USB data by
dropping extra bits
    or zero padding samples (eg 16->24 will zero pad a byte, 24->16
will drop a byte)
  * Channel count differences will ignore extra incoming channels and
zero outgoing
    extra channels (eg 8->2 will just copy the first two and ignore
the rest. 2->8 will
    copy the first two and zero the rest.)
  * Per-alt-mode configurable settings will have a read-only ALSA control (=
like
    sample rate does currently) that can be used to inform the program atta=
ched
    to the ALSA card what the current state of those settings are when the =
USB
    host selects an alt mode.

An simple example of how this could be used to create a second alt mode:

mkdir uac1.0
echo 24 > uac1.0/p_ssize
echo 24 > uac1.0/c_ssize
mkdir uac1.0/alt.2
echo 16 > uac1.0/alt.2/c_ssize

NOTE: Alt modes are separately selectable by the host for playback and capt=
ure
so the host can pick and choose as desired. There is no need to make an alt=
 mode
for every combination of playback and capture settings. In this
example the host can
pick either 24 or 16 bit samples for capture, but is only allowed 24
bit samples for
playback as both alt.1 (via uac1.0/p_ssize) and alt.2 (via default copied t=
o
uac1.0/alt.2/p_ssize) have been configured as 24-bit.


On Thu, Apr 25, 2024 at 11:08=E2=80=AFAM Pavel Hofman <pavel.hofman@ivitera=
.com> wrote:
>
>
> On 25. 04. 24 11:22, Takashi Iwai wrote:
> > On Wed, 24 Apr 2024 09:40:52 +0200,
> > Pavel Hofman wrote:
> >>
> >>
> >> On 17. 04. 24 13:07, Pavel Hofman wrote:
> >>
> >>> I am considering implementation of multiple altsettings to f_uac2, so
> >>> that multiple combinations of channels and samplesizes can be offered=
 to
> >>> the host.
> >>>
> >>> Configuration:
> >>> --------------
> >>> * each altsetting for each direction should define
> >>>    * channel mask
> >>>    * samplesize
> >>>    * hs_bint bInterval
> >>>    * c_sync type (for capture only)
> >>>
> >>>
> >>> Perhaps the easiest config would be allowing lists for the existing
> >>> parameters (like the multiple samplerates were implemented). All the
> >>> list params would have to have the same number of items - initial che=
ck.
> >>> First values in the list would apply to altsetting 1, second to
> >>> altsetting 2 etc.
> >>>
> >>> Or the altsetting could be some structured configfs param - please is
> >>> there any recommended standard for structured configfs params?
> >>>
> >>>
> >>> Should the config also adjust the list of allowed samplerates for eac=
h
> >>> altsetting? Technically it makes sense as higher number of channels c=
an
> >>> decrease the max samplerate, e.g. for via a TDM interface. If so, it
> >>> would need either the structured configuration or some "list of lists=
"
> >>> format.
> >>>
> >>>
> >>> Implementation:
> >>> ---------------
> >>>
> >>> Parameters could be turned to arrays of fixed predefined sizes, like =
the
> >>> p/s_srates. E.g. 5 max. altsettings in each direction would consume o=
nly
> >>> 4 * (5-1) + 3* (5-1) =3D 28 extra ints (excluding the samplerates con=
fig).
> >>>
> >>> Currently all descriptor structs are statically pre-allocated as ther=
e
> >>> are only two hard-coded altsettings. IMO the descriptors specific for
> >>> each altsetting could be allocated dynamically in a loop over all
> >>> none-zero alsettings.
> >>>
> >>> Please may I ask UAC2 gadget "stakeholders" for comments, suggestions=
,
> >>> recommendations, so that my eventual initial version was in some
> >>> generally acceptable direction?
> >>>
> >>
> >> This feature has coincidentally arisen in recent commits by Chris
> >> https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivit=
era.com/T/
> >>
> >> Maybe Takashi's commits to the midi gadget could be a way
> >> https://patchwork.kernel.org/project/alsa-devel/list/?series=3D769151&=
state=3D%2A&archive=3Dboth
> >> The midi gadget allows multiple configurations now, where configs are
> >> placed into a separate block.X configfs directory. That way the config=
fs
> >> recommendation to keep one value per item is adhered to and the
> >> configuration is nice and clean.
> >>
> >> This method would nicely allow various samplerate lists for each
> >> altsetting, without having to use some obscure list of lists.
> >>
> >> The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
> >> altsetting ID. I am not sure the dot index not starting with 0 would b=
e
> >> an issue.
> >>
> >> Now the question would be what to do with the existing (and the new
> >> params added by Chris) flat-structure parameters which apply to (the
> >> only one) altsetting 1. Maybe they could be used as defaults for the
> >> other altsettings for unspecified parameters?
> >>
> >> I very much appreciate any input, thank you all in advance.
> >
> > IMO, a softer approach would be to use subdirs for alt1+ while flat
> > files are kept used for alt0.
>
> Thanks a lot for your help. IIUC almost all existing configs for the
> UAC1/2 functions apply to the "run" altsetting - altsetting 1. The
> altsetting 0 is for stopping the operation, IIUC. Actually that's how
> the stream stop is detected on the gadget side - transition alt1 -> alt0.
>
> Did you perhaps mean the first "running" altsetting?
>
>
> >  Alternatively, we may allow creating
> > alt0, too, and the values there will win over the flat values.
> >
>
> IIUC this would be the meaning of default configs, in case they are not
> specified in the subdir. I like that as it would make the configuration
> easier if not generated by some script.
>
> Thanks,
>
> Pavel.
>
>
