Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59B48530F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 13:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A779818E7;
	Wed,  5 Jan 2022 13:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A779818E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641387323;
	bh=8JL+5tV0OySHqWZPF4qHORWko9npkfbM3ji3E/RcwN8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhXgz77AQCjZzvsWZwK6phMuED++zq0OojiQVwzP3tHZ6IoiCifBJPdxnPUQDr8+f
	 fIH/NqJIlMqKKZBqkbhy7eTZ7J2xDMpiFRqcuibI+3xGU7rcrvyWm4mfK5DdMpfCnk
	 UqNWjiMCxMKMbcmsW0RRruRe/6rqyIgn8Xl/UYBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D95E0F8007E;
	Wed,  5 Jan 2022 13:54:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77DEF8007E; Wed,  5 Jan 2022 13:54:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by alsa1.perex.cz (Postfix) with ESMTP id B1BC1F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 13:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1BC1F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="poHHO9as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=8JL+5
 tV0OySHqWZPF4qHORWko9npkfbM3ji3E/RcwN8=; b=poHHO9asTjYHqcf7RngaT
 PEav9gXE49h6m/TZkBsSRcWs3CJ7u0BVm2hkrsQUPvNzNExPwUdudNLJUgj5ka2S
 wsaDHe2XA87izUCSG9RFoO8aXFbllADtJVEiPzyj7SZy+sQpQqtBv0VUnq0mfZ8Y
 aGHaMQjnMXnGBRuLHh9xhk=
Received: from [192.168.31.101] (unknown [183.194.153.98])
 by smtp10 (Coremail) with SMTP id DsCowADXSM7nlNVhfw4aGQ--.47504S2;
 Wed, 05 Jan 2022 20:53:59 +0800 (CST)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220105034103.12484-1-fbl718@163.com>
 <s5ha6gak2qf.wl-tiwai@suse.de> <YdV5MNWOwgrtH2UC@kroah.com>
 <757a4402-1067-e3c8-8ca3-43ee62047ebe@163.com> <YdWElRjkZ0lybrMJ@kroah.com>
 <6bf35d26-73d4-ba14-f931-8d379c623482@163.com> <YdWQLOtV8Tz8ArrH@kroah.com>
From: Baole Fang <fbl718@163.com>
Message-ID: <7de9fab1-589f-a737-c00e-f98812a23c71@163.com>
Date: Wed, 5 Jan 2022 20:53:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdWQLOtV8Tz8ArrH@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: DsCowADXSM7nlNVhfw4aGQ--.47504S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYQ6JUUUUU
X-Originating-IP: [183.194.153.98]
X-CM-SenderInfo: 5ieoliqy6rljoofrz/1tbiYwh-6VaEGamGPAAAsl
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, Elia Devito <eliadevito@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>
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

On 2022/1/5 下午8:33, Greg Kroah-Hartman wrote:
> We can not just "ignore" it, you need to fix your change up and resend
> it in a proper format so that it can be applied.
>
> As-is, it is not acceptable, sorry.

Thank you, I'm going to resend the patch.

Best Regards,

Baole Fang

