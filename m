Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5886B171
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:15:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAA4847;
	Wed, 28 Feb 2024 15:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAA4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129726;
	bh=Vk295kKDMzFpZB/8nhWQVEICNUF3WooKh1u2dSw8pN8=;
	h=Date:Subject:From:To:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=agTz2GAa/MTZayofCD1h6uelEKnEWMZrraT+tsXI39v3LGZzjvLHNwlsUSZdIqhsy
	 WVdpWRF8rAxI9l+cs5GhkYWujzCg0RdVWrISSeDtw6LnYSfumaM7ROcbn7zzNidmke
	 gCQCfewOAkflSj3Ar6yuaXvKKd+C8igVpl9VhEUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DA8CF80636; Wed, 28 Feb 2024 15:14:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97996F8061D;
	Wed, 28 Feb 2024 15:14:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256FAF801C0; Wed, 28 Feb 2024 09:32:58 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B2B2FF80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 09:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B2FF80087
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave01.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rolf.anderegg@weiss.ch>)
	id 1rfFMt-00Cw8e-8r
	for alsa-devel@alsa-project.org; Wed, 28 Feb 2024 09:32:48 +0100
Received: from [192.168.178.21] (216-35-142-46.pool.kielnet.net
 [46.142.35.216])
	(Authenticated sender: rolf.anderegg@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id 8C5E242962DB1;
	Wed, 28 Feb 2024 09:32:46 +0100 (CET)
Message-ID: <7e5f5a65-89d8-48d6-b68f-b6c7059124e6@weiss.ch>
Date: Wed, 28 Feb 2024 09:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Content-Language: de-CH
From: Rolf Anderegg <rolf.anderegg@weiss.ch>
To: Michele Perrone <michele.perrone@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
 <17a48bbd-6b2c-4977-89f8-03f3385d3a56@weiss.ch>
 <20240227235446.GA70770@workstation.local>
 <e8795263-1412-45b0-a69f-52e77f297390@weiss.ch>
Autocrypt: addr=rolf.anderegg@weiss.ch; keydata=
 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 JWA=
Organization: Weiss Engineering Ltd.
In-Reply-To: <e8795263-1412-45b0-a69f-52e77f297390@weiss.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <170910916694.3168.8053484815802565275@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.13)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8L4HC4R3GnuR7+qD9rHOuJPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wI8D5AnkcPR12/sl/nlqnGQ20HGDJnwk8BgzAUpYTUGKvp
 k7Vp2UXVHEQMIct0liLyq0F5WGEMaAwm/QyupqBLswKQDamPN66SYe4XX4xmgNYi8jPSOqMpXyxz
 1SFbC/xCrc6+jfAWpOi5avZGEbYgWRgl89k6cKf1iJxRG8IcT+9GDmAvFHSHx2HBjhHCKFArnvUy
 zoTfAGEbL5I354EAryNCh0sMXXeuXmotCoWhk9TpA8IawZcEJ5eDI3ZDgiQAKQlQdTfwbSciar+2
 JCMst0dEunmtVTQWqR0MJGYnYGBIZS4rRgm1GD0QN7Psq7kMoOLjGsRz/MUE6aIZoCcUNXR4aVG4
 tVHU1Zldyy+zfVon+9Pn3aYzvvoqrs7wclNi0CKKRGa+t4ZBzRvxtXyVi2+ZrpvcQF0mktyij7U2
 V1mYqffhoXnZj6JC/A974b1HeHqthr/U3o1IuS+Gq5wqvOy/qTjPtP7Ta+yLEuSDIzhrjIHsvvRj
 yQOzr25FPf/Deo2F/515C8kJ0QodJwfrmFGs5lmow6gOzU/CbOds0gEiRQv+PVjjwa+Z5RFCOMSV
 sQHI0u4NO4MMNg+sLPhZupg8GpP9x1tFExoUL6K3zu1xDLvRc/a45Dsa1cZOCjdGj2Ro24HfhFgv
 /ptc2HMK/ewoUbbvAAsp/Y5TqkIlPCzo6zsMBiN5CrtOSZw5b+451ik5DiX2z1F9JbG4lF8B/8qG
 kDojAe2aJyDkQM0pC7cFUId8seO8As+Tst0t5jOpH3wwlHcRQ8p4k07mcKTO2bWYpzCssYaBWMYl
 qDITmJ31amXqxSKZgaIFj7g4oID1cbkDjGBMIKNr1eSIR0X1w6nIoDr0sXUZ7YZoZ/GZ+tk+XPe8
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
Message-ID-Hash: LNQJIEVQNUT7X3JIXY3RABRV65J6EE4W
X-Message-ID-Hash: LNQJIEVQNUT7X3JIXY3RABRV65J6EE4W
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:14:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: rolf.anderegg@weiss.ch
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNQJIEVQNUT7X3JIXY3RABRV65J6EE4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi again, quick followup:
So basically it's like this:

```
spdif-opt-input-1/2  ---+
spdif-coax-input-1/2 --(or)--> digital-input-1/2 -----------------> stream-output-1/2
aesebu-xlr-input-1/2 ---+
muted ------------------+

stream-input-1/2 --------------------------+----------------------> spdif-coax-output-1/2
                                            +----------------------> aesebu-xlr-output-1/2
                                            +--analog-output-1/2 --> analog-xlr-output-1/2
                                                         +-----------> analog-coax-output-1/2
```

And all potential mixing (e.g. volume processing) would be done in userspace on the firewire host.

On 28.02.24 09:14, Rolf Anderegg wrote:
> Hi Takashi
> 
> Thanks for your inquiry. Concerning the routing it's one pretty simple routing mode.
> I guess it's best if I send you the routing excerpt from our DICE firmware (for low & mid ratemodes, the high rates are similar but with optional dual-wire routing):
> 
> [...]
> 
> Best regards,
> Rolf Anderegg
> 
> On 28.02.24 00:54, Takashi Sakamoto wrote:
>> [...]
>>
>> I assume that the actual source selection of 'digital-input-1/2' is done
>> in the router function of DICE chip as well as the selection between
>> 'digital-input-1/2' and 'stream-input-1/2'. The mixer function of the
>> chip is not used as I expected, thus the selection should exist as the
>> source of audio signals for the outputs. However, in the above description,
>> I cannot find such selection.
>>
>> Or the device has a fixed route between 'stream-input-1/2' and
>> 'analog-{xlr,coax}-output-1/2'? The user can not hear the audio signal
>> of opt/coax/xlr digital input ports in the analog outputs?

Exactly, this is fixed as you can see in our DICE routing method.

>>
>>
>> Thanks
>>
>> Takashi Sakamoto

Best regards,
Rolf Anderegg
