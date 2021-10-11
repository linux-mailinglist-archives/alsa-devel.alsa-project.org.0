Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E342A42A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F311694;
	Tue, 12 Oct 2021 14:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F311694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634040980;
	bh=yH0tqlNIs/W5lC0X8b1dxkvS3BQ9RcCT8Ds0YjmBAq0=;
	h=Date:From:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=gp3jUtzGLlvmOQXQJkkdX8LK2YmJjPiIh/iukCJjvHbYao+4cpuW5JTfTIkkBwcBH
	 Ksc0D31ZdZRWMbw+bP/oBZQwyPY4T4Ogvb/ZllYqiz007po9WsPhGU0carbqiRhZza
	 mrrzIADnDsefp6jECSJLWbONwv3wgtdnreDQXZw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A86CF804FD;
	Tue, 12 Oct 2021 14:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0FCBF80269; Mon, 11 Oct 2021 10:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 MISSING_HEADERS,MISSING_SUBJECT,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C16F80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 10:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C16F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="mRWZwtHC"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; s=smtp; t=1633940214; h=From: Date: Message-Id:
 Content-Transfer-Encoding: Content-Type: Sender;
 bh=/UPVV8tiTVRwDxisZJsFD8Fbiwrl8XJT2DaSQzbczlc=;
 b=mRWZwtHCtw3ZVZzQm1BqYiE8lECQXRXeF5Q+AwFHwk5gS466kLJe2APJ9FU0UVPe/c4fuUpz
 z6Sh3vJFVysxghc217c4pE5vUKt37M3uz8HhquRd5a53fZunPd/IakUVDqGob8KDc2PAQgEh
 Mii/5soomS0trfVqDOX7b412uKE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6163f2e4ff0285fb0a813866 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:16:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 47752C43460; Mon, 11 Oct 2021 08:16:36 +0000 (UTC)
Received: from [192.168.1.100] (unknown [157.48.161.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D280C4360C;
 Mon, 11 Oct 2021 08:16:23 +0000 (UTC)
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <20211011081636.47752C43460@smtp.codeaurora.org>
Date: Mon, 11 Oct 2021 08:16:36 +0000 (UTC)
From: srivasam@codeaurora.org (spamassassin system account)
X-Mailman-Approved-At: Tue, 12 Oct 2021 14:13:20 +0200
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


On 10/8/2021 9:00 PM, Mark Brown wrote:
> On Fri, Oct 08, 2021 at 07:37:12PM +0530, Srinivasa Rao Mandadapu wrote:
>> On 9/28/2021 2:01 PM, Srinivas Kandagatla wrote:
>>> In that case you should probably consider using regmap_register_patch()
>>> for corrections to the default registers in sm8250 case.
>> As regmap_register_patch() not working in this use case, updating defaults
>> in probe for sc7280 specific differences.
> In what way is regmap_register_patch() not working?

Even after using this API, reg cache is not updating with the latest 
default values.

The regmap_register_patch() implementation is bypassing Cache and 
writing values to HW.

The requirement for updating previous defaults in cache is not solving here.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

