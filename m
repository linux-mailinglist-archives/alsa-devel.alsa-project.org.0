Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C77FD8E4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 15:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48D3BC0;
	Wed, 29 Nov 2023 15:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48D3BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701266651;
	bh=Q7JQac1l+q9YWoR2JcpGulIO5fC75p+yjkUDt6cg2YE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k+VoTOOQ5nGn4yF1Y0Hxs6VOtlqTMM5h24gPWBzzFoVMA1Oxe6QBepFYl2y76kdDr
	 mXf+/ebiA1U2z8ekyDBlsB5mreCRwW7Ze3Dbh+6mIEfCrcA9i5iRQFUI/TE8GJ8AV7
	 p35zpH7qNYhTNbQ5IEjW4nWYmUxxm3t7iM36A2G0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E79EF80579; Wed, 29 Nov 2023 15:03:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23AE2F80571;
	Wed, 29 Nov 2023 15:03:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06A27F8016E; Wed, 29 Nov 2023 15:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87983F800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 15:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87983F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm3 header.b=FCuX4ljA;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iQKmN7iP
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 192FC5C00FC;
	Wed, 29 Nov 2023 09:03:25 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 Nov 2023 09:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701266605; x=1701353005; bh=+F
	jPUdugsH0a6dOIOixL2XBuQtlNr6a5HKKtMTHQ7xw=; b=FCuX4ljA+Fy43Ox/m1
	LEsn0v4Y2l3m/XJJ5+6HnJn9taXxejL8TlcURXjeWZ3/eiGjxZp+rG2DLMHkHl0V
	Llo/vlHpkcjy2FaVfWbU0qJjGecrmOVVnVEjZ9i7hHxHQRro1w9LNZ3gsRm2Vo1o
	LYo/aaK/kNN8NfBdomARvkY4DitpsOrQeVLoqoeApBGQ/SATUE6k8OhsLeBQKqla
	TPwP11SKKISZmcbjFag2k0oGhdYLfw92mN/fEnjHlP/0sUSA06DVVlbNcEtmlRgC
	MQEgRv/nYUQhbnaselcbEqTUDI0GxmhKrO5u1c5EMMgFKodxiT26Jev+uV6rk5CF
	umFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701266605; x=1701353005; bh=+FjPUdugsH0a6
	dOIOixL2XBuQtlNr6a5HKKtMTHQ7xw=; b=iQKmN7iPhJjfJU8vroWhG5T1pKfXy
	EyfX8tbbG6ZUPyVxn29FO81ekTG7m1ZYnkoOHut7g8P5Ykcai0mc1fXHQ7CGQbk2
	9CwtyspVoBDxdZwr4vVBASvRnnfpj/WIa+PQRECVeGJod0UAU7GuiXSTL4A3QcMA
	dsYlQMD982d0E+dJH9NqLjosrag8vLv0UAbg2E+Pk3K/QVx+SQ47wLTtzcw9tajF
	V9f4ST9dK+/R24rNGVUynIQaq8NiLlM5poKAMPPGQfN8XJQn7LMoAkU+5LuH01pS
	i1hWstlV+pnbMzvG5vhJGWgdZA04XnqGOWQaXPQoMc9tsqUK5MmMFtIsA==
X-ME-Sender: <xms:q0RnZU5YS_4ZZtdyEsCkc6hRWi4TjI4nOPYI8quoO7AXmjkUYzAcyw>
    <xme:q0RnZV7JSEsTiskQAAQbkacWUgdoPFsxwCdOSQJ4yFeFjBRugIUim6_xm3XXWsMw5
    CKPEpDuanQ9Sn7Xm_U>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:q0RnZTeJ8JD8iQLv97blvKOVQ88-EVdS02dqbxGpsZsXu-zGX0norw>
    <xmx:q0RnZZJCSUdSA-wU1xnKfGswTRBuDckSq5IRfijII3AzF2B5K-s1bw>
    <xmx:q0RnZYJI3GKdztSwOrzY5HqDu9fsM8IukLIUBYDEXuU2U7i8JgQhtQ>
    <xmx:rURnZV58pcd1WFAqj8Y-cSeuC46c6yPk7hW4Qk5Az-QtgJtKe4Y9xQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 39829B6008D; Wed, 29 Nov 2023 09:03:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <46d0248d-c322-4856-8e9e-6468ac1b7a02@app.fastmail.com>
In-Reply-To: <20231128140818.261541-16-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
 <20231128140818.261541-16-herve.codina@bootlin.com>
Date: Wed, 29 Nov 2023 15:03:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herve Codina" <herve.codina@bootlin.com>,
 "Qiang Zhao" <qiang.zhao@nxp.com>, "Leo Li" <leoyang.li@nxp.com>,
 "Jakub Kicinski" <kuba@kernel.org>,
 "Shengjiu Wang" <shengjiu.wang@gmail.com>, "Xiubo Li" <Xiubo.Lee@gmail.com>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/17] soc: fsl: cpm1: qmc: Handle timeslot entries at
 channel
 start() and stop()
Content-Type: text/plain
Message-ID-Hash: BQKHGWNCCDRUTPGZO4VAWRWYZKBYK33C
X-Message-ID-Hash: BQKHGWNCCDRUTPGZO4VAWRWYZKBYK33C
X-MailFrom: arnd@arndb.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQKHGWNCCDRUTPGZO4VAWRWYZKBYK33C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 28, 2023, at 15:08, Herve Codina wrote:
> @@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> qmc_chan_info *info)
>  	if (ret)
>  		return ret;
> 
> +	spin_lock_irqsave(&chan->ts_lock, flags);
> +
>  	info->mode = chan->mode;
>  	info->rx_fs_rate = tsa_info.rx_fs_rate;
>  	info->rx_bit_rate = tsa_info.rx_bit_rate;
> @@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct 
> qmc_chan_info *info)
>  	info->tx_bit_rate = tsa_info.tx_bit_rate;
>  	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
> 
> +	spin_unlock_irqrestore(&chan->ts_lock, flags);
> +
>  	return 0;
>  }

I would normally use spin_lock_irq() instead of spin_lock_irqsave()
in functions that are only called outside of atomic context.

> +static int qmc_chan_start_rx(struct qmc_chan *chan);
> +
>  int qmc_chan_stop(struct qmc_chan *chan, int direction)
>  {
... 
> -static void qmc_chan_start_rx(struct qmc_chan *chan)
> +static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
> +
> +static int qmc_chan_start_rx(struct qmc_chan *chan)
>  {

Can you reorder the static functions in a way that avoids the
forward declarations?

     Arnd
