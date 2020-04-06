Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE819F114
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 09:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1241670;
	Mon,  6 Apr 2020 09:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1241670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586158965;
	bh=l+1rtqZ7Tlyl+hCiYFx1eOFW8/4k2wOO612tJSykejk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESk4ujfXFz35E5i2IIZOdFBDASHwNBqE1NasaE8KzegoHChiCY4/pLMvgObChTtJh
	 LK8gF2JLLehYS5Be6z70/baRHt4yot6PaS9ech0yFFu5u5gg4VI0JKzIDpLmxFBX8D
	 8tHpo+Z3XPp5a3HprDRw35LKn4jf4+pGulk9ZGNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 013D0F80121;
	Mon,  6 Apr 2020 09:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6CFAF80257; Mon,  6 Apr 2020 09:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 774CEF80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 09:41:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E3566A0040;
 Mon,  6 Apr 2020 09:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E3566A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586158891; bh=oRvyULE8sfwntPKH7ssldex9ekosa884bkmkkebTEEE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QJFudroOULaw2ln1NYfS78NPg0icqyvygc1B6KPSJSXAXGWum1GPrXDQjLUQQelPf
 NgOerb5gab7ASMyUfOeJwwMLQ9e4IybOcAu2CpOZ2+21bO/0JKR/ZQ0ujm9E12xXFw
 T1naOvdGhDdPNdynYGU67dOE2r6RKPoNUdN501Kw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 09:41:29 +0200 (CEST)
Subject: Re: [PATCH 3/5] chtrt5645: Add MEDION-E1239TMD60568-0.1-Wingman.conf
 symlink to chtrt5645-dmic2.conf
To: Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-3-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ab089f04-4650-7bbb-ee8a-7d33e3afd8f6@perex.cz>
Date: Mon, 6 Apr 2020 09:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405183454.34515-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
> The Medion Akoya E1239T 2-in-1 uses a digital mic connected to the
> dmic2 pin, rather then the default analog mic on in2.
> 
> Add a long name symlink to chtrt5645-dmic2.conf for this, so that
> the right config is used.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/chtrt5645/MEDION-E1239TMD60568-0.1-Wingman.conf | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 120000 ucm2/chtrt5645/MEDION-E1239TMD60568-0.1-Wingman.conf
> 
> diff --git a/ucm2/chtrt5645/MEDION-E1239TMD60568-0.1-Wingman.conf b/ucm2/chtrt5645/MEDION-E1239TMD60568-0.1-Wingman.conf
> new file mode 120000
> index 0000000..7823e31
> --- /dev/null
> +++ b/ucm2/chtrt5645/MEDION-E1239TMD60568-0.1-Wingman.conf
> @@ -0,0 +1 @@
> +chtrt5645-dmic2.conf
> \ No newline at end of file
> 


Applied. Thanks.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
