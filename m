Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0761F10EACB
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 14:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BBCF165F;
	Mon,  2 Dec 2019 14:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BBCF165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575293242;
	bh=xXyfBFu+XNniib1l3XNG4STScKTyGWZH7fNEdviAwcI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bSjG4WPT9ibO85/646GZ7W3WLh++zM5aq3C24ZybaJYT+ImqjuR0TfshOLwKk9LOQ
	 NVV7+sFLBkvOUEHVnlaPvOzbnXtbdns2a5M704gzBHnAicn1zD2i92oEAewiIX7YHm
	 KJD+g8BKa6IqJNFl8adEiyTM0z2x6sNp5sQWc2pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A38F80214;
	Mon,  2 Dec 2019 14:25:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C18EF80214; Mon,  2 Dec 2019 14:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992C0F800F0
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 14:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992C0F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="MFgYNQHA"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 97A7A22FFC;
 Mon,  2 Dec 2019 14:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1575293132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DFTeQ1gi+pUfrY3UQzpw5o5Z5UIGPMvFq3bPc0USv1E=;
 b=MFgYNQHAh0xhw1nV+V/Ss6ZECDip75Jp85p6U7XwSwZ9K0qmQxzkvowS/wofAyo8yvVzvl
 nhdZtONzJyX4D74zJ4JFCll5Q1GNbyyJDBNNUh41i9fBUFeW/t2wDMMcqxzRVB/89pAF8u
 roSEnKpbuLWTX4S9VpLOgXyweCmo6NA=
MIME-Version: 1.0
Date: Mon, 02 Dec 2019 14:25:31 +0100
From: Michael Walle <michael@walle.cc>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <0d5be3b17e26de6bda1c65a1b853ad20@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 97A7A22FFC
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[];
 DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] simple card, asymetrical configuration
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Kuninori,

there seems to be a problem in the simple-card using the following 
device tree fragment:

sound {
	compatible = "simple-audio-card";
	simple-audio-card,format = "i2s";
[snip]
	simple-audio-card,bitclock-master = <&dailink0_master>;
	simple-audio-card,frame-master = <&dailink0_master>;

	simple-audio-card,cpu@0 {
		sound-dai = <&sai6>;
	};

	simple-audio-card,cpu@1 {
		sound-dai = <&sai5>;
	};

	dailink0_master: simple-audio-card,codec {
		sound-dai = <&wm8904>;
	};
};

Just for the background, I have hardware with the LS1028A which only 
have unidirectional SAIs. But two of those SAIs (one for playback and 
one for capture) are connected to one codec (with a shared bit and frame 
clock).

So I thought the example in the simple-card bindings makes sense for my 
case. Although I don't really know what "(Mixing)" means.

Nevertheless, using the fragment above, the kernel oopses or fails to 
probe the hardware. I've traced that back to the following:
  - the count is correct: the kernel reports "link 2, dais 3, ccnf 0". 
please note the 3 dais here.
  - but simple_dai_link_of() will always "allocate" two dais from the 
pool:

         cpu_dai                 =
         dai_props->cpu_dai      = &priv->dais[li->dais++];
         codec_dai               =
         dai_props->codec_dai    = &priv->dais[li->dais++];

While this still works for the first link, the second one will fail 
because codec_dai will not be valid.

Btw, converting that to two explicit dai-link nodes, the dai count will 
be 4 and it will work.

Is my use case correct or should I use the two explicit dai-link nodes? 
But in any case there seems to be a bug in simple-card.

-michael
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
