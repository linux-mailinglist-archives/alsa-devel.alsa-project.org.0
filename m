Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC546D4EA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 14:57:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D9B265D;
	Wed,  8 Dec 2021 14:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D9B265D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638971856;
	bh=jWsu7/gtePy0cSGbow70Yc2ov0Y9NQK0HAlO1r4xW6Q=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fR+2GybNwW0UaF7+GH+MzhMbWqmuQMMEkRRq9yM+PJULKhrxdhztMYiMxEqwqlanW
	 oTikDnda+G3K1PkWqfCzZgcwXEpYmHlw4ZgRy9oYx/59KoGzYPC6C29rhZfGOWwQAT
	 kWkTISsFjLMXHhWu3FRD9t+j+eno9IAy9exqOTrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17B17F804EC;
	Wed,  8 Dec 2021 14:56:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 174B2F804E5; Wed,  8 Dec 2021 14:56:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF82FF800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 14:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF82FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="alpZsATh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FuEjgipc"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2A3A83200708;
 Wed,  8 Dec 2021 08:56:02 -0500 (EST)
Received: from imap41 ([10.202.2.91])
 by compute3.internal (MEProxy); Wed, 08 Dec 2021 08:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=SR
 cSXUjguzugv++L6GbsNqJ1cl64FxRyK9PgzZ60HBQ=; b=alpZsAThkgEkTMR3O0
 4G9NiSO38e4DC6UhRVWQhHZKXVxZgATVGebcJHEGrA+rHSJsPBDfEtcFCO2exWb2
 ln6aU5uq3NTkOOORSxr3CrkyTsp63q+uas4ipRukM5lOvWG8u/MCkz8vMOkcdzCI
 fXUesKMsejvu2dxjT8+7BBWsiF75Lzps3R59FUKdmkLS+ucxOoZgYlNSPnLmWezJ
 PDNCYI0USr0Vc1fqGvDtfzAGhV4HLq39gyMs2Xckfqv4WGdZiouKPOvJHe4nupmc
 Mw8GuDle4oiqfxffXwLpCZDGMeBibiAfp4K0wyqBr0yIagNwL/VGjdxlwarRRKxH
 o2Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=SRcSXUjguzugv++L6GbsNqJ1cl64FxRyK9PgzZ60H
 BQ=; b=FuEjgipcDHx5TO9jF1dJki87fmzUMTYG/G2qzicKtTsJ5+7TsUuvq+PQv
 nAr7ZohaC9jBY9sj8aiG5m1amRRt41n48bNeTeevXSaqjSNpn1WCBguupmzeUbNb
 mudCQIAwF+bH/dnraxC7/aJ7wIswA4DexE7S0zU/MEd+rRu3VJda/1Y1bIAoaSSZ
 GZIWkgLrdnzvGEFnu40xlh+nazE18xVt6uJ0KWuHVHiBZSWo9teNUuAQxkyCeI98
 7oBuqcT0ht2Bf6IhHknOiPDpBhIf3yaPUtinGLBHSJEvlDUXE4yh8fcmygODLEzq
 JjaVXEVBh7ZNxem+LMrIeAFX5g1TQ==
X-ME-Sender: <xms:cLmwYWaW8GFUudzXy8aQY32mACU8tfhAVc-SA-6Chc8ir14DuztiSg>
 <xme:cLmwYZbJjTymqljcdb9dHSOug-4tkxEwEz1HhJGZ77N0QGxHDq9NjJyqGWiaejEqP
 z2sSLd3R8Cb-M49mlo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecuggftrfgrthhtvghrnheptdefhedvkedtteevueefhedukeegudehheeh
 tdeujeeukedvteettddtheeiuedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:cLmwYQ_xIw1OI6jM2vSgmdky2HIc1w4u0BvOeIjPJM4mUjTQCwWOWw>
 <xmx:cLmwYYqJmGNfMIFvCLaNJ9iRhSWlUqnx65Yyh1jiVd2q1TChRBDJWA>
 <xmx:cLmwYRpQACcFSMYvsVFqwYYQOB0AG9ZbjUrvayouLjXTJyQGyDu8YA>
 <xmx:cbmwYSnDB5OAwsKqsdT54XKMDSatKOtkXkcmRs6go2RJvAtp1JczDA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 36E443C031B; Wed,  8 Dec 2021 08:56:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4492-g121c2470aa-fm-20211206.001-g121c2470
Mime-Version: 1.0
Message-Id: <76f28e78-0e9d-45ce-96a3-5c36f880ea6b@www.fastmail.com>
In-Reply-To: <20211208095209.1772296-1-perex@perex.cz>
References: <20211208095209.1772296-1-perex@perex.cz>
Date: Wed, 08 Dec 2021 22:55:41 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Jaroslav Kysela" <perex@perex.cz>,
 "ALSA development" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] kselftest: alsa: Use private alsa-lib configuration in
 mixer test
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kselftest@vger.kernel.org
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

On Wed, Dec 8, 2021, at 18:52, Jaroslav Kysela wrote:
> As mentined by Takashi Sakamoto, the system-wide alsa-lib configuration
> may override the standard device declarations. This patch use the priv=
ate
> alsa-lib configuration to set the predictable environment.
>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: linux-kselftest@vger.kernel.org
> Link: https://lore.kernel.org/alsa-devel/Ya7TAHdMe9i41bsC@workstation/
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>  tools/testing/selftests/alsa/mixer-test.c | 50 ++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)

I'm not positively for the patch since it can take developers puzzled du=
e to
the symbol dependency newly introduced in unreleased version of alsa-lib.
It's better to check the version of alsa-lib in Makefile to avoid develo=
pers=E2=80=99dole
if we have enough respect to embedded developers, especially forced to w=
ork
with legacy userspace. (and it often occurs).

As a side note, I think it better to change symbol table (alsa-lib/src/V=
ersions.in)
if introducing new public symbol of c library.


Regards

Takashi Sakamoto
