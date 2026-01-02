Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E390CEF6D6
	for <lists+alsa-devel@lfdr.de>; Fri, 02 Jan 2026 23:29:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E9560183;
	Fri,  2 Jan 2026 23:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E9560183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767392979;
	bh=v12toz5kmCaN+PrUoB6C3hx+gdTT7Rngk1AHIAKCD+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d/ALFjKDbR5kUAmxxirA6JtfID9gr3kcs/Kqd4XKlJ0jERdXdRzTooJOlGEYK5hWQ
	 tu/vz+kiY1x7JxIeD/vwhZjhHE7YpX2CoOwL6EixmvlKh12gY0XbwD4yhFxU0sT1iu
	 iO3T1YKrHymIAwS81/gSAkwmT022NyuvwJKQa+GU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8C9DF805E4; Fri,  2 Jan 2026 23:29:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B18F805D3;
	Fri,  2 Jan 2026 23:29:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECFA1F8032D; Fri,  2 Jan 2026 23:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1418CF8010B
	for <alsa-devel@alsa-project.org>; Fri,  2 Jan 2026 23:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1418CF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JxhXE3ZE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14C2E60141
	for <alsa-devel@alsa-project.org>; Fri,  2 Jan 2026 22:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE6DC4AF09
	for <alsa-devel@alsa-project.org>; Fri,  2 Jan 2026 22:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392912;
	bh=v12toz5kmCaN+PrUoB6C3hx+gdTT7Rngk1AHIAKCD+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JxhXE3ZEETgXRtUG1L4UlGHkecs0gAhjnHV7ZbtKbi9vqcRy8XhuT90eNbaTQkg+E
	 kHqNI+PAcTF3hLjEKvRA9PGzxMxTutPV2vLvqYU9rEpETvJ8wFhuVGj7AmO7Wd8hTk
	 r2cwCYvolmUI013b9AJPIC4YrFhqb68MA7mpkl9rxuXMwaHA9rC6hOA+90rWeC8gLl
	 bvbrh6jlw3AHJQbhTSZX50UZuRZn9ghtek+BC7Re+kL8f3w86rZP/YDShU2xpQqTVr
	 TY5CGwMf5I6so/8kv+8lUMetKm+j0GetTBjQzUVKPY0OroyklMBBSHN2ec4Zc/xW1G
	 LPcdSHFeErg8A==
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64bea6c5819so15071528a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jan 2026 14:28:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmL5daSSpjVvd7gvOdYRsG1kpX4D8lEnDV1/ZP0Sxlef464S0N9dfEk+wssvFOeu0q5P17a3S7NSZk@alsa-project.org
X-Gm-Message-State: AOJu0YzPNTuxhIbVCvvwVFivpAl+TTDhTC0VTcUzxS6Ulq7HKIyepqI9
	JB9LOi8+9MTy3LnxKuhIrmd2KBRZRbcY7Csfa+OPGdrCBOoTxhDSWFO3WSGcRjDPj9zFtdxOKGv
	/cbqrnTHD8ZWUSpHgXFWQ4YFWhH9WEw==
X-Google-Smtp-Source: 
 AGHT+IE2JLIwT7IzxFl60D2dsx0IDVP1SIlSI+s2AD7FdZOQSMfJy6hvEhKAAA21Q/AGI3Vf39dZQogTm5dSOtl2jfc=
X-Received: by 2002:a17:907:6d22:b0:b79:f965:1ce1 with SMTP id
 a640c23a62f3a-b803705df6bmr4538227066b.42.1767392911283; Fri, 02 Jan 2026
 14:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20251226083914.1052653-1-oder_chiou@realtek.com>
 <20251230175333.GA854335-robh@kernel.org>
 <2f37dcd86a9c41808b918371a23dfebb@realtek.com>
In-Reply-To: <2f37dcd86a9c41808b918371a23dfebb@realtek.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Jan 2026 16:28:19 -0600
X-Gmail-Original-Message-ID: 
 <CAL_Jsq+dwkZqOi3F9Fi7O8e_NoMsATa6HX=9Ns_7aQ+WRatRkw@mail.gmail.com>
X-Gm-Features: AQt7F2pS2jCEN-893t6kWLP9CXJ7CiHTBU9bOR4YQlzq-UnRBBtTQMljDjmrh3I
Message-ID: 
 <CAL_Jsq+dwkZqOi3F9Fi7O8e_NoMsATa6HX=9Ns_7aQ+WRatRkw@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
Cc: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
 "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Flove(HsinFu)" <flove@realtek.com>,
	=?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MEARWSPHNT7UESE4J2LU5FK4M4KP3KDZ
X-Message-ID-Hash: MEARWSPHNT7UESE4J2LU5FK4M4KP3KDZ
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEARWSPHNT7UESE4J2LU5FK4M4KP3KDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 30, 2025 at 8:27=E2=80=AFPM Oder Chiou <oder_chiou@realtek.com>=
 wrote:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Wednesday, December 31, 2025 1:54 AM
> > To: Oder Chiou <oder_chiou@realtek.com>
> > Cc: cezary.rojewski@intel.com; broonie@kernel.org; lgirdwood@gmail.com;
> > krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> > linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> > alsa-devel@alsa-project.org; Flove(HsinFu) <flove@realtek.com>; Shuming=
 [=E8=8C=83
> > =E6=9B=B8=E9=8A=98] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.co=
m>; Derek [=E6=96=B9=E5=BE=B7
> > =E7=BE=A9] <derek.fang@realtek.com>
> > Subject: Re: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add sup=
port for
> > ALC5575
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > On Fri, Dec 26, 2025 at 04:39:14PM +0800, Oder Chiou wrote:
> > > Audio codec with I2S, I2C and SPI.
> > >
> > > Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../bindings/sound/realtek,rt5575.yaml        | 61
> > +++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> >
> > Where's the rest of the series? You are missing an In-Reply-To header a=
nd that
> > breaks the tools (b4).
> >
> Hi Rob,
>
> Sorry about that =E2=80=94 this was a send-email threading issue.
> I'll resend the full v11 series with proper In-Reply-To headers.

v12 please so the tools aren't confused by the 3 versions of v11.

Rob
