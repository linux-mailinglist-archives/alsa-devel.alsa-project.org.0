Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A149C76FD89
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A462083B;
	Fri,  4 Aug 2023 11:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A462083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691141958;
	bh=O5VmrgsLUgiu/FWU1h+undk9tTfNHgP7BGxnOYbovkM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dQzposZOsAeicqoYA9XLZMIa3Z4QmwUs+hiFAQ5Z2X94CLnZruLMzT70U/+YtmKO5
	 g4clOF5xbw+LlRnRp/AKzfcMRUS4JpJDdnXYs5oOrU22NHIy7ot+MVwxUlVzsPt27t
	 ZyGTvlAJLxA2SWyCZIFZquryfAILXqzTzCen6xMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E200F8025A; Fri,  4 Aug 2023 11:37:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F33F80520;
	Fri,  4 Aug 2023 11:37:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A909F801D5; Tue,  1 Aug 2023 19:55:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out-105.mta0.migadu.com (out-105.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E63DF80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 19:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E63DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=hGIBe21m
Date: Wed, 2 Aug 2023 03:55:08 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1690912530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWOOSwutO8CjDZ7stkOk4f0uk4tE2rXG9FVIc37QCFw=;
	b=hGIBe21mTtYCn+KGLh5ZV+K1g8WWp374ltQgYtojOpduxmzHzdd90pzGnMjbvsHWYOGLDB
	4vhJdS626aEIoAoIORtVMc7OzRr/92ozhW7gg0dlPKGsCY8boJML4WVlgO1ccxIM5G2RGR
	TeRj1hUmCIkPUsaRfH6p8iffOwS+eL+Z/MlUqu6tm6WX4DQg9cG20yiJeE57Zl1lI6uDba
	fPfwfuP8TFYve+uoFlK7AGftoI6hBs/nYgrDES4OKLiTWDqk/VM0SIXxCuo74g5k7CfnMq
	lgNj3Z+D8cqxvjrKd9MEualqhruxnbDdYwL++Fraq1qISaFYwQJsYbldcCtFmA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Subject: Re: How do I set up multiple codecs on one I2S - without TDM?
Message-ID: <ZMlG_AyRJhmHnLI8@titan>
References: <ZMBRMnv0GQF4wyfQ@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMBRMnv0GQF4wyfQ@titan>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MQZS23VFW6T64HFZXZK2EEY5A5ALBOQW
X-Message-ID-Hash: MQZS23VFW6T64HFZXZK2EEY5A5ALBOQW
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:37:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQZS23VFW6T64HFZXZK2EEY5A5ALBOQW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I return days later with an answer, so I shall try and answer my own email.

On Wed, Jul 26, 2023 at 08:48:18AM +1000, John Watts wrote:
> So my questions are: 
> - How do I express this in terms of ALSA and sound card concepts?
> - How do I express this in the device tree?

After reading the following links:

https://lore.kernel.org/all/87fsw124wn.wl-kuninori.morimoto.gx@renesas.com/
https://lore.kernel.org/r/87ilbx1kh3.wl-kuninori.morimoto.gx@renesas.com

I found that this is a case of 1:N cpus to codecs, and this can be
solved using audio-graph-card2.

So I set up a device tree like this:

	wm8782_1: stereo-adc-1 {
		compatible = "wlf,wm8782";
		Vdda-supply = <&reg_vcc>;
		Vdd-supply = <&reg_vcc>;
		#sound-dai-cells = <0>;
		port {
			wm8782_1_ep: endpoint {
				remote-endpoint = <&card_ep_1>;
			};
		};
	};

	wm8782_2: stereo-adc-2 {
		compatible = "wlf,wm8782";
		Vdda-supply = <&reg_vcc>;
		Vdd-supply = <&reg_vcc>;
		#sound-dai-cells = <0>;
		port {
			wm8782_2_ep: endpoint {
				remote-endpoint = <&card_ep_2>;
			};
		};
	};

	wm8782_3: stereo-adc-3 {
		compatible = "wlf,wm8782";
		Vdda-supply = <&reg_vcc>;
		Vdd-supply = <&reg_vcc>;
		#sound-dai-cells = <0>;
		port {
			wm8782_3_ep: endpoint {
				remote-endpoint = <&card_ep_3>;
			};
		};
	};

	sound {
		compatible = "audio-graph-card2";
		links = <&i2s2_port>;
		multi {
			ports {
				#address-cells = <1>;
				#size-cells = <0>;
				port@0 {
					card_ep_0: endpoint {
						remote-endpoint = <&i2s2_ep>;
					};
				};
				port@1 {
					card_ep_1: endpoint {
						remote-endpoint = <&wm8782_1_ep>;
					};
				};
				port@2 {
					card_ep_2: endpoint {
						remote-endpoint = <&wm8782_2_ep>;
					};
				};
				port@3 {
					card_ep_3: endpoint {
						remote-endpoint = <&wm8782_3_ep>;
					};
				};
			};
		};
	};

	&i2s2 {
		pinctrl-0 = <&i2s2_pins>, <&i2s2_din_pins>;
		pinctrl-names = "default";
		status = "okay";
		i2s2_port: port {
			format = "i2s";
			mclk-fs = <128>;
			bitclock-master;
			frame-master;
			i2s2_ep: endpoint {
				remote-endpoint = <&card_ep_0>;
			};
		};
	};

Immediately I was able to record from the needed channels!
After tinkering with the driver registers I was even able to get it to
read the channels properly :)

I hope this helps somebody else in my situation.
John.
