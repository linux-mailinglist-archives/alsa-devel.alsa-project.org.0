Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9194CEAD
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 12:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889AFEB6;
	Fri,  9 Aug 2024 12:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889AFEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723199555;
	bh=NUmuGYnW1zobD4I8ByFfdLUrvlZrQZRt1EAvdJj9LVo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pi6o36RTqMIaD64QoO4r20pGbV/FTfnrE0M+RJoaAqkQcqa6qAKfpyt5hIY7glgoJ
	 1VRlUUWvk3P20hHQA7D3WRT2/3CPQ8O1q86L808LgycVvZxiWzBiXndu+pWZPecygk
	 Y5aJHrIBFsqLaLswnaBDFakqNSpzVCfcHXpqobsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0C76F805A1; Fri,  9 Aug 2024 12:32:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B4BDF805AE;
	Fri,  9 Aug 2024 12:32:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F6BBF800E3; Fri,  9 Aug 2024 12:18:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E69BF800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 12:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E69BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l/z8CpxO
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-81f8d644fe0so29389639f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723198484; x=1723803284;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfsf46z9wf1GW1rvhufmjrriglyClBeG24vWvW2wbYg=;
        b=l/z8CpxOwxaRTY61Wc7T+ir83OtLam2el4aYLOu5NkRSev7M9svT+9OU/P/L8qS54w
         M2JJpt8ASz47LlTzh/PS50POV9ksiyZfugsuYWgYvdT8eIhaFxwr9ylH07PDp2F9+noH
         p/FQM4M/lNdDWvUDaTb9pwPaTOxF4G3ImVdMaxE3whFfi6AVl1tETZLm/YKST0o26WiR
         ESrpcVy6TGRxfpVcFw48GKNWzJRIKsm9r9PIaAwG7zyDBh0f0gRqnTrB6L4YUNkeMNsM
         uni8CL8DeFyxg+vhayQFJ2y6ydqDKq0WMNpZApFICMJBCBIZOiiKcxPxq1/48qhxHOI1
         GLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723198484; x=1723803284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfsf46z9wf1GW1rvhufmjrriglyClBeG24vWvW2wbYg=;
        b=sy5uZekXY8nPFsKTQ3EUjRdKJJ9dATjXZBhcXdYyOwfEzPj75EL6c3QRytyIlHuAJi
         8kM6zgojU3LDqeK5TYMVPebjuqhcmllm/oeFFhJl/0MECpg2HQAzs+DE34erlL3iupAM
         Zz5KLdX6q5ldkENNmzk13AfyvXUb7xQ+4UaCW8I/21O5e9E7750GxefwEhC8XmPMuwND
         eAeWJcpb7sSg6zvreqNJVYfLYO8k+q/cjaYCuaJ4MqXIf5QbyiOyu+3npt2gH2S3Unes
         9oq4q8m9iPDQed4077xiL4bgVSVddA4V4yH8vuYJZLP+fZRiXEUthN0rK1r5JS8qZpkD
         EdvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVThxFHHN/btNnypLL1q7cFUchrD0DHIxqjOryhlbUdfsmdB/+ZE0OMwyweirdH9pOd3nsbMr9nrg9wZ6zpWIyNPIh1XYr4e+6LmWw=
X-Gm-Message-State: AOJu0YxeHmeILkD2DIPVRkb8zAIPRRC4ih/SOKuuPxihQHWEkee2maTq
	Cq7oY+iR26jGKXSnW5TSp0ZOWcqKf4adCURjoDI452Yhpa60yyGrx8qcwYg8yBod3I7h3W3OWs7
	5PbAKhExYtD5fnYIF/FjleR8i+gI=
X-Google-Smtp-Source: 
 AGHT+IFFfg/JrZPkYtkwOZLbKVpyn11ErpaZHgtBuGGv7zwTVNOInIB98snU98XMHtncdjjRq9qFib8e3L29raeRvWE=
X-Received: by 2002:a05:6e02:156d:b0:375:c394:568b with SMTP id
 e9e14a558f8ab-39b7a472925mr11954185ab.21.1723198483575; Fri, 09 Aug 2024
 03:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
In-Reply-To: <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 9 Aug 2024 18:14:32 +0800
Message-ID: 
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 vkoul@kernel.org,
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JYKDE5CFGQSXETUDP4LF5B4YWET2HWR2
X-Message-ID-Hash: JYKDE5CFGQSXETUDP4LF5B4YWET2HWR2
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYKDE5CFGQSXETUDP4LF5B4YWET2HWR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 9, 2024 at 3:25=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >>>> Then there's the issue of parameters, we chose to only add parameter=
s
> >>>> for standard encoders/decoders. Post-processing is highly specific a=
nd
> >>>> the parameter definitions varies from one implementation to another =
-
> >>>> and usually parameters are handled in an opaque way with binary
> >>>> controls. This is best handled with a UUID that needs to be known on=
ly
> >>>> to applications and low-level firmware/hardware, the kernel code sho=
uld
> >>>> not have to be modified for each and every processing and to add new
> >>>> parameters. It just does not scale and it's unmaintainable.
> >>>>
> >>>> At the very least if you really want to use this compress API,
> >>>> extend it
> >>>> to use a non-descript "UUID-defined" type and an opaque set of
> >>>> parameters with this UUID passed in a header.
> >>>
> >>> We don't need to use UUID-defined scheme for simple (A)SRC
> >>> implementation. As I noted, the specific runtime controls may use
> >>> existing ALSA control API.
> >>
> >> "Simple (A)SRC" is an oxymoron. There are multiple ways to define the
> >> performance, and how the drift estimator is handled. There's nothing
> >> simple if you look under the hood. The SOF implementation has for
> >> example those parameters:
> >>
> >> uint32_t source_rate;           /**< Define fixed source rate or */
> >>                 /**< use 0 to indicate need to get */
> >>                 /**< the rate from stream */
> >> uint32_t sink_rate;             /**< Define fixed sink rate or */
> >>                 /**< use 0 to indicate need to get */
> >>                 /**< the rate from stream */
> >> uint32_t asynchronous_mode;     /**< synchronous 0, asynchronous 1 */
> >>                 /**< When 1 the ASRC tracks and */
> >>                 /**< compensates for drift. */
> >> uint32_t operation_mode;        /**< push 0, pull 1, In push mode the =
*/
> >>                 /**< ASRC consumes a defined number */
> >>                 /**< of frames at input, with varying */
> >>                 /**< number of frames at output. */
> >>                 /**< In pull mode the ASRC outputs */
> >>                 /**< a defined number of frames while */
> >>                 /**< number of input frames varies. */
> >>
> >> They are clearly different from what is suggested above with a 'ratio-
> >> mod'.
> >
> > I don't think so. The proposed (A)SRC for compress-accel is just one
> > case for the above configs where the input is known and output is
> > controlled by the requested rate. The I/O mechanism is abstracted enoug=
h
> > in this case and the driver/hardware/firmware must follow it.
>
> ASRC is usually added when the nominal rates are known but the clock
> sources differ and the drift needs to be estimated at run-time and the
> coefficients or interpolation modified dynamically
>
> If the ratio is known exactly and there's no clock drift, then it's a
> different problem where the filter coefficients are constant.
>
> >> Same if you have a 'simple EQ'. there are dozens of ways to implement
> >> the functionality with FIR, IIR or a combination of the two, and
> >> multiple bands.
> >>
> >> The point is that you have to think upfront about a generic way to pas=
s
> >> parameters. We didn't have to do it for encoders/decoders because we
> >> only catered to well-documented standard solutions only. By choosing t=
o
> >> support PCM processing, a new can of worms is now open.
> >>
> >> I repeat: please do not make the mistake of listing all processing wit=
h
> >> an enum and a new structure for parameters every time someone needs a
> >> specific transform in their pipeline. We made that mistake with SOF an=
d
> >> had to backtrack rather quickly. The only way to scale is an identifie=
r
> >> that is NOT included in the kernel code but is known to higher and
> >> lower-levels only.
> >
> > There are two ways - black box (UUID - as you suggested) - or well
> > defined purpose (abstraction). For your example 'simple EQ', the
> > parameters should be the band (frequency range) volume values. It's
> > abstract and the real filters (resp. implementation) used behind may
> > depend on the hardware/driver capabilities.
>
> Indeed there is a possibility that the parameters are high-level, but
> that would require firmware or hardware to be able to generate actual
> coefficients from those parameters. That usually requires some advanced
> math which isn't necessarily obvious to implement with fixed-point hardwa=
re.
>
> > From my view, the really special cases may be handled as black box, but
> > others like (A)SRC should follow some well-defined abstraction IMHO to
> > not force user space to handle all special cases.
>
> I am not against the high-level abstractions, e.g. along the lines of
> what Android defined:
> https://developer.android.com/reference/android/media/audiofx/AudioEffect
>
> That's not sufficient however, we also need to make sure there's an
> ability to provide pre-computed coefficients in an opaque manner for
> processing that doesn't fit in the well-defined cases. In practice there
> are very few 3rd party IP that fits in well-defined cases, everyone has
> secret-sauce parameters and options.

Appreciate the discussion.

Let me explain the reason for the change:

Why I use the metadata ioctl is because the ALSA controls are binding
to the sound card.  What I want is the controls can be bound to
snd_compr_stream, because the ASRC compress sound card can
support multi instances ( the ASRC can support multi conversion in
parallel).   The ALSA controls can't be used for this case,  the only
choice in current compress API is metadata ioctl. And metadata
ioctl can be called many times which can meet the ratio modifier
requirement (ratio may be drift on the fly)

And compress API uses codec as the unit for capability query and
parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
format and output rate, channels definition just reuse the snd_codec.ch_in.

I understand your concern, but there seems no better option.
If you have, please guide me. Thanks.

Best regards
Shengjiu Wang
