Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB74C62A3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 06:37:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116EC16CB;
	Mon, 28 Feb 2022 06:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116EC16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646026643;
	bh=Q3x7zInUjMu6OQ4uQY11Phj2IUpzhZWqeTFdGRSd3wo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UMteynGDL8UainVdN8ym/sdydQ9OXd6lygPzRYAEyZYwzKQjMb4hHCO0ug4QJKta2
	 3NX2n8SmsEcs/zAKECuPWzuynFLIapoXW4IPmX9vOtcOJqZ4fsYdH+kvuIXdNYDUpR
	 gUe7O5Il05p0h2gA1hsv+cVJbt4PaYMnla9p2u74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74FFBF80154;
	Mon, 28 Feb 2022 06:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA16F8013C; Mon, 28 Feb 2022 06:36:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3FF4F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 06:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3FF4F80125
X-QQ-mid: bizesmtp66t1646026556tyirbc64
Received: from [10.4.23.188] (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 28 Feb 2022 13:35:55 +0800 (CST)
X-QQ-SSF: 00400000002000C0F000B00A0000000
X-QQ-FEAT: Lg5IqoGaTUiMqD9QmPOVVVUSBZwdeVhrVtVSYS6IbRXTYkpu65lD5XJugA00Z
 z+hL+zeEL2n0vAURhWsTokV758JqVEa/BLXjX4VHB9jr3bgIzIwiIFHQ12AI7Kfl8j4I5Uo
 m70Myf7LmKVCTSjvC9EAzTgd2x7f03qYCLOd6m+RtATAxZ54cYAR4lngr7RjFFllitmvZA8
 maZtwiSxaT8d6iAXYj1gJJkr9JST2hWENJC8UbmmjHv2cqtV+Tv1nJp9J1Bk2NTtnZZYmMf
 LjO6Kk0BRtgLE3QM2VaSry4561kjUhDOd2DLbTSmq8jgNuGdkjWnZpYtdS9KXb6Rnlb7OnM
 UWEQx/wtMd7WUBvqs2sDhXENAz+jnKhvo270LpM
X-QQ-GoodBg: 2
Message-ID: <e0ec0068-877d-00a0-ef4e-f1a3b68fac7c@uniontech.com>+7703BAF62BA51E95
Date: Mon, 28 Feb 2022 13:35:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v4 2/2] ALSA: core: Remove redundant variable and return
 the last statement
To: Joe Perches <joe@perches.com>, perex@perex.cz, tiwai@suse.com
References: <20220228050253.1649-1-tangmeng@uniontech.com>
 <20220228050253.1649-2-tangmeng@uniontech.com>
 <e5c1ba2f7db29b78066d12dab812b7a1c0a37a81.camel@perches.com>
From: tangmeng <tangmeng@uniontech.com>
In-Reply-To: <e5c1ba2f7db29b78066d12dab812b7a1c0a37a81.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 2022/2/28 13:20, Joe Perches wrote:

> Hi Meng Tang.
> 
> For the next time: it's not necessary (or even good) to add a sign-off
> for another person unless they specifically authorize one.
> 
> You wrote and are submitting these changes, I merely gave you simple
> suggestions as to how you could improve them.
> 
> cheers, Joe
> 
Okay，thanks for the heads up and suggestions.

Cheers, Meng



