Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974098D882
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 18:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18BE11679;
	Wed, 14 Aug 2019 18:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18BE11679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565801652;
	bh=EXfDHIB0lytKI84ClXeW2ZWIgpDvvQVkHepbLeN9iuU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkDPidvwrk//Qy6UCpzs6dgVov9u53z8Hq7QsFs2Ed2eiUQP97gNcQGcXeYS3DjaO
	 d7gCBigWy1YFnXeN00ZZdbn9T7/dbgceVuxOUtcasS8eSLM8SkO56DklQqVpWFYysY
	 SUlq5K7qu4uxIQG7a0l9yO30HFOkI9ZBgLEEm7rI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F00F80214;
	Wed, 14 Aug 2019 18:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67942F80214; Wed, 14 Aug 2019 18:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8672BF8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 18:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8672BF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CvzoltGC"
Received: by mail-oi1-x242.google.com with SMTP id 16so4687483oiq.6
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M0CSxnNXmuj+pjk7IUEAh0BRSZ8qfHrlum+FKVn+rFc=;
 b=CvzoltGC6X+IuOfJFNguQ97pwnY3jD2aB4gWbGDLpgZj5Y2gVgPcez1evn6oj/olYO
 Bx1TL3jEymbet3PAVnc9L08MrF7XanyghxjKbT2HJk3YFcSUv9ah4tlgfw0kikkVOs0x
 dpG7yIsNQ1c4J1jvZNqPqXKPEcmd2OyavyYfPYUbLpGGFm2rwT8FJiwQ6dXkpFGfeuzt
 w2SapaV4oqoHWRC85blJagTgYJT//WDpVMSVrgSyDxXb1l3cVZGmJQ7KlYRv4MM5bHML
 1V7iXHbSd0EJCcWWPLc6KDnwVk4Wd8BqlXs858ApKCjxv78XJNG6Jc3N//vjJFUX/Npg
 QXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M0CSxnNXmuj+pjk7IUEAh0BRSZ8qfHrlum+FKVn+rFc=;
 b=GoGtSCYjtQaO55LUi1EeRT1NekijScgQqFsZrsdhUJi9/H+7iryQ0ZY2nCLCv3nno4
 PHNf9x3BoVBB59mbyGhf62oBqOwMCcDsBZM7kGOfhQwJ10e0tgjU6Zs9oaVxUwVTURxH
 f6nJ7fOf50QOMWtCHH5Z4EVwFwf2upK4uKYlnbsPO5T7ZMDV8nVO0Z/RvC4JvSwJpWR3
 kzZpayckdZspe4AjoFHtrazmse8Vi8Zl4BTEVOyBa7JGmuuyjX+gNJgiRwzGjohbCnKf
 jmiEAksMFUwAXADsZIXZ1CJ+kXNEGyA/8Hi4Z1KyusWvKm0foX0pLppqOZ2R/rsgfNT5
 eECw==
X-Gm-Message-State: APjAAAUU9lt7/yiel+e6R4RObyWYlrb41x0awGlLWq8IuVE5TobPvsf6
 cBzc13DMpDjXT1T1GyyswZMYbBy1HffkOhcNNDM=
X-Google-Smtp-Source: APXvYqzdc34uUNL3SjBrYU0fRR91RRLvN84PyRIluNxm228s/zpoSn3dkxLYUB0G74UH7V6KeiEwswd1ixvIinoMy7w=
X-Received: by 2002:a54:4895:: with SMTP id r21mr607081oic.66.1565801539386;
 Wed, 14 Aug 2019 09:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190814023625.21683-1-benquike@gmail.com>
 <s5hzhkcb6dh.wl-tiwai@suse.de>
 <CAKpmkkUv=arsdJiexaM-UVhXEwfGN=zreny9P_kDNhQUij8=FQ@mail.gmail.com>
 <s5hmugbbtc2.wl-tiwai@suse.de>
In-Reply-To: <s5hmugbbtc2.wl-tiwai@suse.de>
From: =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>
Date: Wed, 14 Aug 2019 12:52:07 -0400
Message-ID: <CAKpmkkVzT5H0RTAu_Fa=9_gjf5v7k3qzPnnJvPpBp3BaP7G0ag@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Content-Type: multipart/mixed; boundary="0000000000008b7f79059016947b"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, security@kernel.org,
 Wenwen Wang <wang6495@umn.edu>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 alsa-devel@alsa-project.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] Fix an OOB bug in parse_audio_mixer_unit
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

--0000000000008b7f79059016947b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Takashi:

Thanks for the guide.
The new patch is confirmed and attached.

On Wed, Aug 14, 2019 at 12:33 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 14 Aug 2019 18:28:39 +0200,
> =E5=BD=AD=E8=BE=89 wrote:
> >
> > Hi, Takashi:
> > Here the problem is that `desc->bLength` is controlled by the device
> side,
> > so  `desc->bLength` may not represent the real length of the descriptor=
.
> > That is why I use pointer arithmetic operations to derive the real size
> of the
> > buffer
> > in my patch.
>
> But bLength is checked before calling this, i.e. it's already assured
> that bLength fits within the buffer limit.  So, the result calls don't
> have to care about the buffer limit itself, and they can just
> concentrate on overflow over bLength.
>
>
> thanks,
>
> Takashi
>
> >
> > On Wed, Aug 14, 2019 at 2:36 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> >     On Wed, 14 Aug 2019 04:36:24 +0200,
> >     Hui Peng wrote:
> >     >
> >     > The `uac_mixer_unit_descriptor` shown as below is read from the
> >     > device side. In `parse_audio_mixer_unit`, `baSourceID` field is
> >     > accessed from index 0 to `bNrInPins` - 1, the current
> implementation
> >     > assumes that descriptor is always valid (the length  of descripto=
r
> >     > is no shorter than 5 + `bNrInPins`). If a descriptor read from
> >     > the device side is invalid, it may trigger out-of-bound memory
> >     > access.
> >     >
> >     > ```
> >     > struct uac_mixer_unit_descriptor {
> >     >       __u8 bLength;
> >     >       __u8 bDescriptorType;
> >     >       __u8 bDescriptorSubtype;
> >     >       __u8 bUnitID;
> >     >       __u8 bNrInPins;
> >     >       __u8 baSourceID[];
> >     > }
> >     > ```
> >     >
> >     > This patch fixes the bug by add a sanity check on the length of
> >     > the descriptor.
> >     >
> >     > Signed-off-by: Hui Peng <benquike@gmail.com>
> >     > Reported-by: Hui Peng <benquike@gmail.com>
> >     > Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> >     > ---
> >     >  sound/usb/mixer.c | 9 +++++++++
> >     >  1 file changed, 9 insertions(+)
> >     >
> >     > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> >     > index 7498b5191b68..38202ce67237 100644
> >     > --- a/sound/usb/mixer.c
> >     > +++ b/sound/usb/mixer.c
> >     > @@ -2091,6 +2091,15 @@ static int parse_audio_mixer_unit(struct
> >     mixer_build *state, int unitid,
> >     >       struct usb_audio_term iterm;
> >     >       int input_pins, num_ins, num_outs;
> >     >       int pin, ich, err;
> >     > +     int desc_len =3D (int) ((unsigned long) state->buffer +
> >     > +                     state->buflen - (unsigned long) raw_desc);
> >     > +
> >     > +     if (desc_len < sizeof(*desc) + desc->bNrInPins) {
> >     > +             usb_audio_err(state->chip,
> >     > +                           "descriptor %d too short\n",
> >     > +                           unitid);
> >     > +             return -EINVAL;
> >     > +     }
> >     >
> >     >       err =3D uac_mixer_unit_get_channels(state, desc);
> >     >       if (err < 0) {
> >
> >     Hm, what is the desc->bLength value in the error case?
> >
> >     Basically the buffer boundary is already checked against bLength in
> >     snd_usb_find_desc() which is called from obtaining the raw_desc in
> the
> >     caller of this function (parse_audio_unit()).
> >
> >     So, if any, we need to check bLength for the possible overflow like
> >     below.
> >
> >     thanks,
> >
> >     Takashi
> >
> >     --- a/sound/usb/mixer.c
> >     +++ b/sound/usb/mixer.c
> >     @@ -744,6 +744,8 @@ static int uac_mixer_unit_get_channels(struct
> >     mixer_build *state,
> >                     return -EINVAL;
> >             if (!desc->bNrInPins)
> >                     return -EINVAL;
> >     +       if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
> >     +               return -EINVAL;
> >
> >             switch (state->mixer->protocol) {
> >             case UAC_VERSION_1:
> >
> > --
> > May the Lord Richly Bless you and yours !
> >
> >
>


--=20
May the *Lord* Richly Bless you and yours !

--0000000000008b7f79059016947b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Fix-an-OOB-bug-in-parse_audio_mixer_unit.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-an-OOB-bug-in-parse_audio_mixer_unit.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jzbhs3jz0>
X-Attachment-Id: f_jzbhs3jz0

RnJvbSBkYTE3ZTJkYjA0ZDI5ZDM5ZjMyOTg3MzhiYWRkMDM2Y2YzZjI1NmQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIdWkgUGVuZyA8YmVucXVpa2VAZ21haWwuY29tPgpEYXRlOiBU
dWUsIDEzIEF1ZyAyMDE5IDIyOjM0OjA0IC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gRml4IGFuIE9P
QiBidWcgaW4gcGFyc2VfYXVkaW9fbWl4ZXJfdW5pdAoKVGhlIGB1YWNfbWl4ZXJfdW5pdF9kZXNj
cmlwdG9yYCBzaG93biBhcyBiZWxvdyBpcyByZWFkIGZyb20gdGhlCmRldmljZSBzaWRlLiBJbiBg
cGFyc2VfYXVkaW9fbWl4ZXJfdW5pdGAsIGBiYVNvdXJjZUlEYCBmaWVsZCBpcwphY2Nlc3NlZCBm
cm9tIGluZGV4IDAgdG8gYGJOckluUGluc2AgLSAxLCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
bgphc3N1bWVzIHRoYXQgZGVzY3JpcHRvciBpcyBhbHdheXMgdmFsaWQgKHRoZSBsZW5ndGggIG9m
IGRlc2NyaXB0b3IKaXMgbm8gc2hvcnRlciB0aGFuIDUgKyBgYk5ySW5QaW5zYCkuIElmIGEgZGVz
Y3JpcHRvciByZWFkIGZyb20KdGhlIGRldmljZSBzaWRlIGlzIGludmFsaWQsIGl0IG1heSB0cmln
Z2VyIG91dC1vZi1ib3VuZCBtZW1vcnkKYWNjZXNzLgoKYGBgCnN0cnVjdCB1YWNfbWl4ZXJfdW5p
dF9kZXNjcmlwdG9yIHsKCV9fdTggYkxlbmd0aDsKCV9fdTggYkRlc2NyaXB0b3JUeXBlOwoJX191
OCBiRGVzY3JpcHRvclN1YnR5cGU7CglfX3U4IGJVbml0SUQ7CglfX3U4IGJOckluUGluczsKCV9f
dTggYmFTb3VyY2VJRFtdOwp9CmBgYAoKVGhpcyBwYXRjaCBmaXhlcyB0aGUgYnVnIGJ5IGFkZCBh
IHNhbml0eSBjaGVjayBvbiB0aGUgbGVuZ3RoIG9mCnRoZSBkZXNjcmlwdG9yLgoKU2lnbmVkLW9m
Zi1ieTogSHVpIFBlbmcgPGJlbnF1aWtlQGdtYWlsLmNvbT4KUmVwb3J0ZWQtYnk6IEh1aSBQZW5n
IDxiZW5xdWlrZUBnbWFpbC5jb20+ClJlcG9ydGVkLWJ5OiBNYXRoaWFzIFBheWVyIDxtYXRoaWFz
LnBheWVyQG5lYmVsd2VsdC5uZXQ+Ci0tLQogc291bmQvdXNiL21peGVyLmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL21peGVy
LmMgYi9zb3VuZC91c2IvbWl4ZXIuYwppbmRleCA3NDk4YjUxOTFiNjguLmVhNDg3Mzc4YmUxNyAx
MDA2NDQKLS0tIGEvc291bmQvdXNiL21peGVyLmMKKysrIGIvc291bmQvdXNiL21peGVyLmMKQEAg
LTc0NCw2ICs3NDQsOCBAQCBzdGF0aWMgaW50IHVhY19taXhlcl91bml0X2dldF9jaGFubmVscyhz
dHJ1Y3QgbWl4ZXJfYnVpbGQgKnN0YXRlLAogCQlyZXR1cm4gLUVJTlZBTDsKIAlpZiAoIWRlc2Mt
PmJOckluUGlucykKIAkJcmV0dXJuIC1FSU5WQUw7CisJaWYgKGRlc2MtPmJMZW5ndGggPCBzaXpl
b2YoKmRlc2MpICsgZGVzYy0+Yk5ySW5QaW5zKQorCQlyZXR1cm4gLUVJTlZBTDsKIAogCXN3aXRj
aCAoc3RhdGUtPm1peGVyLT5wcm90b2NvbCkgewogCWNhc2UgVUFDX1ZFUlNJT05fMToKLS0gCjIu
MjIuMQoK
--0000000000008b7f79059016947b
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--0000000000008b7f79059016947b--
