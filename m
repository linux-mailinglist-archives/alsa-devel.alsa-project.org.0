Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922993C628
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 17:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F0BE85;
	Thu, 25 Jul 2024 17:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F0BE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721920159;
	bh=klhcupiSnzZjEwy2ORCn/f5y48gvFionPVTR6qinpKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WBjPYDKNxrp4aQ53Fn0P3eisiOf5NpPabrqwiV01oGW5qJ5pGoH5iHK4QOskZWf2F
	 ua0rlMaDIYXgL3PsW9PkONJ2b/S+YntlxXXKOUJFQBzF9xqTwLnMyD+BKru/E06HrT
	 kyXTHKID788YB0VJ13qGz6QBjlmyFj4YZXHQsF7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C37CF805AA; Thu, 25 Jul 2024 17:08:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48231F805B1;
	Thu, 25 Jul 2024 17:08:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C02DF8026D; Thu, 25 Jul 2024 17:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C525DF800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 17:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C525DF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=DHgZMX5A;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=lstSyifR
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 15B741140153;
	Thu, 25 Jul 2024 11:06:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 25 Jul 2024 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1721919970; x=
	1722006370; bh=t+z2WwcSe7QLeZynJcabPdsfa6tgNxxAeuqOFR0xAaE=; b=D
	HgZMX5A0fPflfC4LuugsYNlkK3KHsQPEkRmCVS+M9N2EGXOP1Z5X0Ezx9qwJ0H3r
	wgWxJ6xS2AXBdQemZ3hoQVajDgWrwwvCKziohNuEpY044hornDSrPHJ5qVpaOacH
	BMXMlljJDuOKTY3PDoazXqmS6p/TukGGfD3rt+l5Pt19MLJ+BmW2WVMfIGoxcF8z
	Owan2t/I3IMbrR4639nmfHemDX4nOTLvOP/p44rS4DGFQ+1dPKRgWr/YT2eIJxyu
	AaigTMFp4hQNKXkgUfbtVNMmfWfbFAsy/n2MAXN19gIG6zqENQepB/myoGZ8s0hc
	n3n3rqSIgYc50fkdPvaEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721919970; x=1722006370; bh=t+z2WwcSe7QLeZynJcabPdsfa6tg
	NxxAeuqOFR0xAaE=; b=lstSyifRFbckCbX40djberdQyV+adJn3okg68JuzBoLw
	5aQULdMB9cVN/EpJks1lDOg56R7IzCZNoMfidpRQ49KLJDH4VoPIISAfbwK6vFnd
	ErNf7Fyi6KYKqhBI192tNX9QTc/ay99Kk594f/aErUCBrBsXWR+t1sR2A3G9fyaK
	6SQk1WcA/r2jpORFKQn8vdJ3zwiLczMUnFO1kddGmYl5VNsBGvoshhCxHIWIuodp
	e39Mn5Fvu5PASB/IFhqk/0W2BwO7HwTbmCOteQEJQNuFTqOaCI4WMXo3qjqXU45x
	G0mKEtG3vWawOJ/T2aF9PbT6I6vgM4bd29BF3skx5g==
X-ME-Sender: <xms:4WmiZsYNX-txLxLJG22wbcRa2EHygxsei5IoBEcTUrtcoGFEdLG2iA>
    <xme:4WmiZnbdVkxsrJrYyeLTX6XBoBSbl-6hCBBqaMWGdqwESbjccvDpoXckT91woyF_9
    fLI0nAAzW3EWFIZxJ8>
X-ME-Received: 
 <xmr:4WmiZm-nHADuGLwNvWDA_0JdYecwjW45rw0I3VLuoimoanzfulEXmtpxzAbeF1OHtIymrkMaxOFZ6k6pqQAIlzA07XIcwXj8M9Gy>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrieefgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpedtheehieffjeffffekteehhfejgeduuedvhfevgeff
    teejfeevuefgueefuedvudenucffohhmrghinhephhgvrgguvghrpghlvghnghhthhdrih
    htnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdq
    thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:4WmiZmpw2KugmtnQlBhmmFjTmgiKXKbUBgMhbl9Bd3OOpO5PA4gROw>
    <xmx:4WmiZnrdImoZiEWjd5BTraJ-3KIad0vwJrPNOW4wcQNyTkrFiBsVTw>
    <xmx:4WmiZkSFMv1WeFQWv_1WCfwaqO_eD71A1fiwluPRHjhST0YAMQRHfw>
    <xmx:4WmiZnpni3dR2vaq4k4_vj8wWs8oOkqUWjswbbgNLLl8VzCzIKG6Qw>
    <xmx:4mmiZq1_8h-qFL9Tq2y-fusb2CNBzMVDLNO1WwIcuT0dRkrmaumnwfNr>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 11:06:06 -0400 (EDT)
Date: Fri, 26 Jul 2024 00:06:03 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Takashi Iwai <tiwai@suse.de>, "edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, gustavoars@kernel.org,
	clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
Message-ID: <20240725150603.GA109922@workstation.local>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Takashi Iwai <tiwai@suse.de>,
	"edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, gustavoars@kernel.org,
	clemens@ladisch.de, linux-sound@vger.kernel.org
References: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
 <87r0bhipr7.wl-tiwai@suse.de>
 <906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>
Message-ID-Hash: KZJK4OQNWRMTBQHL2CV4PFZ7CRZY5HZO
X-Message-ID-Hash: KZJK4OQNWRMTBQHL2CV4PFZ7CRZY5HZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZJK4OQNWRMTBQHL2CV4PFZ7CRZY5HZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 08:08:14AM -0600, Gustavo A. R. Silva wrote:
> Hi!
> 
> On 25/07/24 07:07, Takashi Iwai wrote:
> > On Thu, 25 Jul 2024 00:24:29 +0200,
> > edmund.raile wrote:
> > > 
> > > Bisection revealed that the bitcrushing distortion with RME FireFace 800
> > > was caused by 1d717123bb1a7555
> > > ("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").
> > > 
> > > Reverting this commit yields restoration of clear audio output.
> > > I will send in a patch reverting this commit for now, soonTM.
> > > 
> > > #regzbot introduced: 1d717123bb1a7555
> > 
> > While it's OK to have a quick revert, it'd be worth to investigate
> > further what broke there; the change is rather trivial, so it might be
> > something in the macro expansion or a use of flex array stuff.
> > 
> 
> I wonder is there is any log that I can take a look at. That'd be really
> helpful.

The original designated initializer fills all of fields with 0.

The new designated initializer assigns CIP_HEADER_QUADLETS (=2) to
struct fw_iso_packet.header_length. It is wrong value in the case of
CIP_NO_HEADER. Additionally it is wrong value in another case since the
value of the field should be byte unit.

I'll post a patch soon.


Regards

Takashi Sakamoto
