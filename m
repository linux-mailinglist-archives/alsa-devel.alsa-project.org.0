Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05FC8A81B0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 13:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 136DCDF6;
	Wed, 17 Apr 2024 13:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 136DCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713352128;
	bh=aVmVSJH9LCw6i75ybBJo26QIBPlpMqwWQh1z29w8aU8=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pOYHKZ9hUq+JSx3tRfSzAeLgKghD4/fKPpbakJ5v6LfPwFS2D9z5L4K73lXHRteSV
	 AXjl3IVWtGVSUR8wGpy9vKxhTsYcHbbZosT8hKVbBmA6aYQFt/1jjQro4nUknt8CgC
	 6DRE6UcXBduH33GHG8UXcSg+NUx81spVuTgdkXF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95FBEF80589; Wed, 17 Apr 2024 13:08:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0851FF8058C;
	Wed, 17 Apr 2024 13:08:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A721DF8025A; Wed, 17 Apr 2024 13:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72A7EF801C0
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 13:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A7EF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=XjP6t3m2;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=ML9k2AOL
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 23F2F175D72;
	Wed, 17 Apr 2024 13:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713352050; bh=aVmVSJH9LCw6i75ybBJo26QIBPlpMqwWQh1z29w8aU8=;
	h=Date:From:Subject:To:Cc:From;
	b=XjP6t3m2vstj1tx5g4IcihOygD1M8A6DGQ0afUE4wAyTXYhHN4GketSTNyNLeF7JL
	 T6EWwHyaahlp4PnXgtWSo9m3v4U6Fx8b8J3PR3pQHg2tUnV3+95VkU1Yk1vw36/kf+
	 ssV0PesgytI74m1sbWHioPuRhWQZTb0ltY0jYaOQ=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzlmUOne_DuO; Wed, 17 Apr 2024 13:07:29 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 7E89C175E07;
	Wed, 17 Apr 2024 13:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713352049; bh=aVmVSJH9LCw6i75ybBJo26QIBPlpMqwWQh1z29w8aU8=;
	h=Date:From:Subject:To:Cc:From;
	b=ML9k2AOLiu1OPx6cRxyDDofLAP5q5iw/Q5GFw4CzSm588pYEMTW5Vc3mbSxIDH7Pr
	 N2E5EI3jUqdaVZ9LiHLpvDyZ36PePI7yQCuZFtqp0k8Ygo5NVVRldFb0+b3ZPv+Cvw
	 UqXkyzw5DliYawqSW5HW2P0zCqUUBRQmYhJE8mHs=
Message-ID: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
Date: Wed, 17 Apr 2024 13:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi
 <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RNAP7DHFH7TQDIP6NJ3MCGNBIOFUKA37
X-Message-ID-Hash: RNAP7DHFH7TQDIP6NJ3MCGNBIOFUKA37
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNAP7DHFH7TQDIP6NJ3MCGNBIOFUKA37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I am considering implementation of multiple altsettings to f_uac2, so 
that multiple combinations of channels and samplesizes can be offered to 
the host.

Configuration:
--------------
* each altsetting for each direction should define
    * channel mask
    * samplesize
    * hs_bint bInterval
    * c_sync type (for capture only)


Perhaps the easiest config would be allowing lists for the existing 
parameters (like the multiple samplerates were implemented). All the 
list params would have to have the same number of items - initial check. 
First values in the list would apply to altsetting 1, second to 
altsetting 2 etc.

Or the altsetting could be some structured configfs param - please is 
there any recommended standard for structured configfs params?


Should the config also adjust the list of allowed samplerates for each 
altsetting? Technically it makes sense as higher number of channels can 
decrease the max samplerate, e.g. for via a TDM interface. If so, it 
would need either the structured configuration or some "list of lists" 
format.


Implementation:
---------------

Parameters could be turned to arrays of fixed predefined sizes, like the 
p/s_srates. E.g. 5 max. altsettings in each direction would consume only 
4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).

Currently all descriptor structs are statically pre-allocated as there 
are only two hard-coded altsettings. IMO the descriptors specific for 
each altsetting could be allocated dynamically in a loop over all 
none-zero alsettings.

Please may I ask UAC2 gadget "stakeholders" for comments, suggestions, 
recommendations, so that my eventual initial version was in some 
generally acceptable direction?

Thanks a lot,

Pavel.
