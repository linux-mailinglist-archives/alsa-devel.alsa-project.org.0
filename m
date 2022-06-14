Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055D54A99D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 08:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB4D1866;
	Tue, 14 Jun 2022 08:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB4D1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655188836;
	bh=KRgIUhJNlsPMatYGOzN8Nxd4i8nC4WXxHBiNWyYxcPo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m8s4MHekfjyu2zi6k91lPKJ/7lWwMUNMzZDk3kuMRM9su/JRzJ45gkWnnFW53F4mw
	 1czNkvn6GtdtKqJhMlYGY8baOUuNoOhYHvHjTU6sXIdb5ChgxgC1vZrhhCG41f0kW4
	 WN8c9zzwVvwqhUZcbNKCEUdJs0fRivEKG3Uk8bw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F34F800E1;
	Tue, 14 Jun 2022 08:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B10F80139; Tue, 14 Jun 2022 08:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75589F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 08:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75589F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="U+UE/qlH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TF8hdFja"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AF7045C006E;
 Tue, 14 Jun 2022 02:39:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 14 Jun 2022 02:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1655188762; x=
 1655275162; bh=YLErNvqZx1IawB0vUHwDOxvcYy8H5o0KiKQdt10QrzY=; b=U
 +UE/qlH2+74a1pdC++OqXtWIXXd/Vn6hgnkHOon4r+GApTLm1chn1Eni8QBPivqK
 1DmND3dY5Lf5l0GtWXgt7QPm0AjuZhExJ0tyQKw6z8CMimhdS0+wNoYmgHvQTQdK
 6BPZqxIr6RPnP/k6ILVSmKysxP9HS+LmzJiev4FiOjlzuKXI4lHk0X+5AY4Kc/ek
 j04+YuxYNLOr/nbKaAhNS2J4AP2gM+iBn9DZLrnO/OsbkpiFu9ll11FUiYaKBtWb
 HivOcOKV/KMN48CZcaWT1iu9FxgbHPBE42z7s/0JR1XrGveuacyt7Vr8ubL/7DUu
 cgIttNkhTCs0Kk0zW1TVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655188762; x=
 1655275162; bh=YLErNvqZx1IawB0vUHwDOxvcYy8H5o0KiKQdt10QrzY=; b=T
 F8hdFjasH8OZY7roQVqWv0Qu+ZYPa18MW26BlKNU9wKY5xC5zqLPIFKkzVO/ar8m
 dYHKe1jQY8qemfN7llew7vSEclxPNrk+rofePAwvISrHImsYBukiOzcxZV78H95Q
 78GK5cMHid6DhEdQ1xIwewusmUU04cZCaNEOoln1OA/8Ql5/yVKm8r2ribVYxfyN
 cS3FEH/4+MyDQsrq9hNfbW86pJg1ZlHa1bvrYkjvAL68tcaXqV32DrxGnm0c0K5t
 WEhthjanMBkjvE7IqTS1W5VezJ/o6VB0pcJdrE3r/8+w1s3qags4uZdJfgy1XB0b
 xyrJBkfVXl5/d0IpAi7ZA==
X-ME-Sender: <xms:Gi2oYnHgdP4g0INELdKQolrmQ7gncQUll3xIh5DO1oB1NVD7CPKCTQ>
 <xme:Gi2oYkUyi4d8wQArFGKLBpWpTW6DO6KfJegGUOLHQ-g2II_AwJlTbZG46fKCQ5S4X
 Ib0Yz8GiCAuYN10pw>
X-ME-Received: <xmr:Gi2oYpK9auqTk03rBrrS6TiPEsI7xv4_NogLK9VN90yHk_nevMwj9zaotIEuqN418N3IyoQqZIWLfq-muciFKWKEgtqBAukgqe7ojW0seZUGF8hMyashPMTyRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddukedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgr
 mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
 cuggftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfh
 iedtheduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Gi2oYlFPP1lcV22QarSqf1uxSt0P4_OvAWNOBD4Y6BXqxT-9OAONlg>
 <xmx:Gi2oYtVPJ3pzCjVz7dUV-rNHoTbDRRgUCFdiTWXsLHroVPDi8BCpWA>
 <xmx:Gi2oYgP4uCMNpZO6zr3l9N94LkmiSqhnDmEmEoNTHJ8E3xhbOFRrpw>
 <xmx:Gi2oYlTmepW70fHSh9e8Uub9_Ckgpu5sZHiq_24x5-SXojU1XJuFFw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 02:39:21 -0400 (EDT)
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock
 specifiers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9e105410-94d5-1801-8919-af8c0cef4de1@sholland.org>
Date: Tue, 14 Jun 2022 01:39:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 wens@csie.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-sunxi@lists.linux.dev
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

Hi Charles,

On 6/13/22 11:15 AM, Charles Keepax wrote:
> Recent updates accidentally updated the clock producer/consumer
> specifiers on this device as part of refactoring the CPU side of the DAI
> links. However, this device sits on the CODEC side and shouldn't have
> been updated. Partially revert the changes keeping the switch to the new
> clock terminology but going back to the CODEC defines.
> 
> Fixes: 7cc3965fde74 ("ASoC: sunxi: Update to use set_fmt_new callback")
> Reported-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

Thanks for the quick follow-up, and sorry for the confusion my earlier comment
caused. I verified that sound is broken (loud static) on a Pine A64-LTS board
with for-next, and is fixed by this patch.

Regards,
Samuel
