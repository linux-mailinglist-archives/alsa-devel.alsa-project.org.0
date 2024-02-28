Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B9686B16E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:15:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EBE20C;
	Wed, 28 Feb 2024 15:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EBE20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129709;
	bh=/wbX6ipmgg7UVsjCuM+UTlMhQJiED+3DcL88oAKvxGw=;
	h=Date:Subject:To:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=goRWVLcCDpcXguixpHTNWg9iHHm/9PIlx003DQuNrJ/lvvzz/Q9tc326HAD3e0oqY
	 u6eRswgar9p6yrnYRLVfJipEeleh86Iv2nKdGGEP8hVAa9+U3242c+IXPVKRoDw4nB
	 iSKkaez+ivwwodhy9Mqh08Q4H+2FPFM1WDgLVz0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5ECAF80603; Wed, 28 Feb 2024 15:14:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8045CF8058C;
	Wed, 28 Feb 2024 15:14:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8F3FF801C0; Wed, 28 Feb 2024 09:14:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from asave01.hostfactory.ch (asave01.hostfactory.ch [185.117.170.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 630BCF80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 09:14:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 630BCF80087
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave01.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rolf.anderegg@weiss.ch>)
	id 1rfF5G-00ClKW-O3
	for alsa-devel@alsa-project.org; Wed, 28 Feb 2024 09:14:36 +0100
Received: from [192.168.178.21] (216-35-142-46.pool.kielnet.net
 [46.142.35.216])
	(Authenticated sender: rolf.anderegg@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id C674C42365C65;
	Wed, 28 Feb 2024 09:14:33 +0100 (CET)
Message-ID: <e8795263-1412-45b0-a69f-52e77f297390@weiss.ch>
Date: Wed, 28 Feb 2024 09:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
To: Michele Perrone <michele.perrone@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
 <17a48bbd-6b2c-4977-89f8-03f3385d3a56@weiss.ch>
 <20240227235446.GA70770@workstation.local>
Content-Language: de-CH
From: Rolf Anderegg <rolf.anderegg@weiss.ch>
Autocrypt: addr=rolf.anderegg@weiss.ch; keydata=
 xsFNBFkqeukBEAC1ZrXwBqOEnVG43swPvPCywbSdn/zqrt5daxvQUse3Z/NhO8/kZSbRyPkO
 q3SI2JU5u+LSzLK9LPnXKy8BZyBhrSA6oCukJte6+niPet2gLlK/+qPPFJU/3fJ2KoFexubj
 lRe+S8hwGQ3s8nVyyfgWSfounEZ55FU9jkrW6rC/7XQgTHINfAuobnXxnZfBMvO/jzPzfXUy
 ds9yCupFTddiX95ZSjEkkvZbtG5Ahfx6MM74BkjknefAZNmvUDnWetMTa6gKLP5fqTVXSAHc
 aAy+TMQTA/bEcd33Nted7ak774S2LyTazDAN2dujRJKH5GcWlTTSLKe/P8deOWDJfuPGnZka
 btbUxFEeUet4VEoqBLNg9B9EwXTT//7UzPtKtzpSpLID+zsFcnDF7MHP3sY9WBzSDNau3h5J
 ZthLYaceNSMbTVFUX570iWIn8F0aKeNg+n+VP4RgZ7LYSTfInQfCl23034yWT/GiMe4ciG8i
 A5mLPB46yMg3JrTCg8jwmisluHE5uorXCWHa1blt1YcAiKr1WVAh8kUSjRaVM16bVIbaXMWK
 MzMOLUj87cJGyxhe1MOYF0glVQypCYSdOyWVCaubD26w8PuAcTHklKFa3Yzwpl9ZaJtlrDo5
 ajxVjl4w7JjMmBohszNazw0GiCYW2wkDiQURa791P/47dnNVswARAQABzSZSb2xmIEFuZGVy
 ZWdnIDxyb2xmLmFuZGVyZWdnQHdlaXNzLmNoPsLBlAQTAQgAPgIbIwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBBnbxbgK/BlBTYDccKzcZirKYqIXBQJkflTYBQkPCRHvAAoJEKzcZirK
 YqIXzRsQAKPiM8n+hGMYeWaLa0Y69FxwPXek4X1NdG4p4KsoFl4+swZLX6pREoav8NiCAKmY
 C8ew04kbi4xeG7RMJrLWaia71SfWg7ZrxFaCwZkpTdBaHJua8I4f1zRklBk06b+1GxidCZgB
 6gl1eaVwpmYqrZk8wNfzCEi95Y/N6ZcRjth7Ds1tZFaKkJOCEi06RFEBeUwzevDRgarJav9A
 1pzEhHT8SJeGI0+qwVLq6b6oiAU/6/BbPD8KHVV1V7dylZFDmOd3t2uAOc9nRtHcKz1T8CRy
 0K9tbxKva/ihcXqkJw1EqyRSYDjMimq/AC1lhk70LakaHVe1qDkzge3FmFC3iDApGglcltDZ
 Gli8KmvK8330B672S+TOON6xRlnKHN1/UZZtrnTwWQOc8bMY3Bw9tamgzvo2fw92y4lr2RCE
 mIidCxLFZEM6Qw7csLpKJewCReMJcrXXBrLASz2P5/yKzPnLkxVfftjHGKN0+81sLIxFsVhh
 MbflocDeWqj0WIAvQClZwcOl3LELCfV6m6XRdE8DAiJkn1PWW3eEB6VnQnOloI16LSMYSQWL
 QAOy8qC09yxC4gQ+ZjVlFI0oyR0cf72HA3q8mTn2W9oH1MHx+EQjTniARh1nO4OWiySWntBi
 cyNCb6xNCbL06dfkpLcjUsjHMdxBqLmnRfpbZ6DJHsMqzsFNBFkqeukBEADNwyIEfkr401gP
 fyUu2yDwHEAVu1Wo4GXt8SljnZ8lMT6WBYru4E3vkoBCQNF17PdsE4H6y2RmIiJfRBatLNYo
 G4pUOswqzskEMPOEwV05J2YvTDUR749nFzIhmJIIZ3GstbAhtWu7bCx2rKHqKkpnYTHehtdz
 hpCDukk/PX5jp3QA5qj0Mlkq+1ePG+czZY8MN4uI1TjqljJaObIxoyojcI8DbQev5PRUhhNc
 DTqqaHMtt5+3RGmBpuDf75EEVqyF6CchWoVknIAbt8c3F0RksD8P5s3lt5Shuh2Ave/nI3qa
 KW3rCO3qDwBl/ptBALDztBEDZIZc7PzEhHnrWaUxHxs/0NQvKOFGyneAflSLvvqgZa26lAEF
 VUXpw0HOAqAxX49+dqUmrDmt/aHQ9Y6PhJpz+ipb/YdLrhy4z0IAPEt3LoVK7r6JAM5v6dCT
 q7ai9rwUZul5NE0hAyq3OcyYFH/WxnsW8+rtHn5kuQbobfOv1hqmAZLNp2z6wkNGRhz0O/+L
 j6D4TjlxK/BbnETy53K/C0H/OAQoAO2RlwERVNC8XcdGsyLbUXUaV13Xy/T9BhxVE0g00XOq
 i4LD8Y6zg97TT4XJhTqXBd2uaSR2tV7w2ka38J10rJ+ylveGUHJnm4Yih0yYZpufb+SOxAov
 ikdIMyaRYCSK17fP5om+ywARAQABwsF8BBgBCAAmAhsMFiEEGdvFuAr8GUFNgNxwrNxmKspi
 ohcFAmR+VNkFCQ8JEe8ACgkQrNxmKspiohexiBAApg6PMDP81xx4I/E3RT8ZLrLGp+k74KiC
 fzSpU1G/6P1T/LYD1WdnqI1RKFBhX1ZOyKET9Cd71HuPqoM0OFHOpqmKl8B9ynPh0Uxlc1fn
 T86Q9CvQHYzw4aqx7tiyrfLpkrqHVnIf68t7qRlTUwX56Y9+4omZx29lrVpn/K3R71pjFmjx
 /fLbkDqMCO7QZzZ8v1bkrzTxK/SNRBKBJwpqBMGYPyTQulYQOQVRYtFcdmWf63RsRitlR/o0
 +dZE6OHwRoJBlrmBjxMAKVxsBIdxlk1Uih9juY1sJZecYNSuNFU7qFU4X/oFULt0Z2xCD5fF
 oqYFL9XzV3o8Sg6KDppMztXph9c/B/gGCzMSo/9ZQMGVThiB5irr1M8CZidUXdTPcu415w9g
 RO8mod0RLJK5e+Rs8fyAkp+Goq+/PC8meoG8yw6enEea/Fme3e10AnqoYDLjezEYWw0xb54T
 By4eEqhdmTxrNN7TTwBWjtPguLO6gk3OXf+F5k4I2LE8mXAdCWfsC+U+RsgSBxRMFncrg33w
 DRNtHY8A8pS2gbvpOMfHBT9uJIqVGyx3hgPnDsCLdiJf+JgPJT7RgKGerAWInm8r4FefxzYi
 PPb3xOyTxayghxPY2o6ClzZ0XcmSGcZEZ6r/+thUiz3+uSvVcLtFAZuUF0leugey7XEs5k4+ JWA=
Organization: Weiss Engineering Ltd.
In-Reply-To: <20240227235446.GA70770@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <170910807420.19401.13415297534817138725@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.14)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+1ZQ9t9CFaPpD7NXhiRI2mPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wI8D5AnkcPR12/sl/nlqnGQ20HGDJnwk8BgzAUpYTUGKvp
 k7Vp2UXVHEQMIct0liJyoyTjV6UJLUoNSxlFJhzJswKQDamPN66SYe4XX4xmgNYi8jPSOqMpXyxz
 1SFbC/xCrc6+jfAWpOi5avZGEbYgWRgl89k6cKf1iJxRG8IcT+9GDmAvFHSHx2HBjhHCKFArnvUy
 zoTfAGEbL5I354EAryNCh0sMXXeuXmotCoWhk9TpA8IawZcEJ5eDI3ZDgiQAKQlQdTfwbSciar+2
 JCMst0dEunmtVTQWqR0MJGYnYGBIZS4rRgm1GD0QN7Psq7kMoOLjGsRz/MUE6aIZoCcUNXR4aVG4
 tVHU1Zldyy+zfVon+9Pn3aYzvvoqrs7wclNi0CKKRGa+t4ZBzRvxtXyVi2+ZrpvcQF0mktyij7U2
 V1mYqffhoXnZj6JC/A974b1HeHqthr/U3o1IuS+Gq5wqvOy/qTjPtP7Ta+yLEuSDIzhrjIHsvvRj
 yQOzr25FPf/Deo2F/515C8kJ0QodJwfrmFGs5lmow6gOzU/CbOds0gEiRQv+PVjjwa+Z5RFCOMSV
 sQHI0u4NO4MMNg+sLPhZupg8GpP9x1tFExoUL6K3zukXEAVpXHN+KhNneRfAtaJGj2Ro24HfhFgv
 /ptc2HMK/ewoUbbvAAsp/Y5TqkIlPCzo6zsMBiN5CrtOSZw5b+451ik5DiX2z1F9JbG4lF8B/8qG
 kDojAe2aJyDkQM0pC7cFUId8seO8As+Tst0t5jMDQJjNziXd8kLO3P5QydE3xPMnfLEyD0O1OYIN
 fEKvNZ31amXqxSKZgaIFj7g4oID1cbkDjGBMIKNr1eSIR0X1w6nIoDr0sXUZ7YZoZ/GZ+tk+XPe8
 9gKQZcpXJ1JhiIk5G2voo1EuiNlqORXEgOos76WS0gK94wcwLRgYWRwLFK8jQodLDF13rl5qLQqF
 oZNDKVI5g7tUPX4FXT+6n0ddWAdaGTbRR7FCGtDSdYE13XjVtKlOBhbloT9p6fUxzRhRr6lVr2P/
 Fnnw8/vv1CEsMS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
X-MailFrom: rolf.anderegg@weiss.ch
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AGYHNLIKX2AMTZIVBBWVZKXVNH5KJKDY
X-Message-ID-Hash: AGYHNLIKX2AMTZIVBBWVZKXVNH5KJKDY
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:14:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: rolf.anderegg@weiss.ch
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGYHNLIKX2AMTZIVBBWVZKXVNH5KJKDY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi

Thanks for your inquiry. Concerning the routing it's one pretty simple routing mode.
I guess it's best if I send you the routing excerpt from our DICE firmware (for low & mid ratemodes, the high rates are similar but with optional dual-wire routing):

static HRESULT routeLowMid (void)

{

	// DAC main gets audio from Firewire

	dalSetRoute(eDAL_INTERFACE_1, TX_INS0_CH0, mute_DAC ? RX_MUTED_CH : RX_AVS1_CH0);

	dalSetRoute(eDAL_INTERFACE_1, TX_INS0_CH1, mute_DAC ? RX_MUTED_CH : RX_AVS1_CH1);

	// AES/EBU OUT XLR 1 gets audio from Firewire

	dalSetRoute(eDAL_INTERFACE_1, TX_AES0_CHL, mute_XLR ? RX_MUTED_CH : RX_AVS1_CH0);

	dalSetRoute(eDAL_INTERFACE_1, TX_AES0_CHR, mute_XLR ? RX_MUTED_CH : RX_AVS1_CH1);

	// AES/EBU OUT RCA 1 gets audio from Firewire

	dalSetRoute(eDAL_INTERFACE_1, TX_AES2_CHL, (mute_RCA|isDualWire) ? RX_MUTED_CH : RX_AVS1_CH0);

	dalSetRoute(eDAL_INTERFACE_1, TX_AES2_CHR, (mute_RCA|isDualWire) ? RX_MUTED_CH : RX_AVS1_CH1);

	aesDualTx_Right_Func(isDualWire?FALSE:TRUE);

#ifdef _BUILD_OLD_MAN202

	// AES/EBU OUT XLR 2 gets audio from Firewire

	dalSetRoute(eDAL_INTERFACE_1, TX_AES2_CHL, mute_XLR ? RX_MUTED_CH : RX_AVS1_CH0);

	dalSetRoute(eDAL_INTERFACE_1, TX_AES2_CHR, mute_XLR ? RX_MUTED_CH : RX_AVS1_CH1);

	// AES/EBU OUT RCA 2 gets audio from Firewire

	dalSetRoute(eDAL_INTERFACE_1, TX_AES3_CHL, mute_RCA ? RX_MUTED_CH : RX_AVS1_CH0);

	dalSetRoute(eDAL_INTERFACE_1, TX_AES3_CHR, mute_RCA ? RX_MUTED_CH : RX_AVS1_CH1);

#endif



	switch (inputSelect) {

	case INPUT_XLR:

		// Firewire IN gets audio from AES/EBU IN XLR

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH0, RX_AES0_CHL);

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH1, RX_AES0_CHR);

		break;

	case INPUT_RCA:

		// Firewire IN gets audio from AES/EBU IN RCA

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH0, RX_AES1_CHL);

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH1, RX_AES1_CHR);

		break;

#ifndef _BUILD_OLD_MAN202

	case INPUT_TOS:

		// Firewire IN gets audio from AES/EBU IN TOS

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH0, RX_AES2_CHL);

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH1, RX_AES2_CHR);

		break;

#endif

	default:

		// Firewire IN muted

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH0, RX_MUTED_CH);

		dalSetRoute(eDAL_INTERFACE_1, TX_AVS1_CH1, RX_MUTED_CH);

		break;

	}

	return NO_ERROR;

}


In this the following parameters are set via the dedicated AV/C commands, that were previously mentioned:
* mute_DAC
* mute_XLR
* mute_RCA
* isDualWire
* inputSelect

Let us know if you have further questions.

Best regards,
Rolf Anderegg

On 28.02.24 00:54, Takashi Sakamoto wrote:
> Hm. I'm sorry but it is still unclear that the destination of audio
> signal in the IEEE 1394 isochronous packet arrived at your device
> (precisely the source port in the router function of TCAT DICE chip).
> It is Playback PCM channel in ALSA word, and depicted as
> 'stream-input-1/2' in my diagram for my convenience.
> 
> ```
> spdif-opt-input-1/2  ---+
> spdif-coax-input-1/2 --(or)--> digital-input-1/2 -----------------> stream-output-1/2
> aesebu-xlr-input-1/2 ---+             |
>                                        v
> stream-input-1/2 --------------------(or)--+----------------------> spdif-coax-output-1/2
>                                              +----------------------> aesebu-xlr-output-1/2
>                                              +--analog-output-1/2 --> analog-xlr-output-1/2
>                                                         +-----------> analog-coax-output-1/2
> ```
> 
> I assume that the actual source selection of 'digital-input-1/2' is done
> in the router function of DICE chip as well as the selection between
> 'digital-input-1/2' and 'stream-input-1/2'. The mixer function of the
> chip is not used as I expected, thus the selection should exist as the
> source of audio signals for the outputs. However, in the above description,
> I cannot find such selection.
> 
> Or the device has a fixed route between 'stream-input-1/2' and
> 'analog-{xlr,coax}-output-1/2'? The user can not hear the audio signal
> of opt/coax/xlr digital input ports in the analog outputs?
> 
> 
> Thanks
> 
> Takashi Sakamoto
