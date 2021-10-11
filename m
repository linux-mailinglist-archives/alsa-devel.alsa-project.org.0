Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375E42A42B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1B61696;
	Tue, 12 Oct 2021 14:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1B61696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634041004;
	bh=XMvHvr8GOELPW5Ivk/I/Kep5mmBTxgo0aK6qM1zwBms=;
	h=Date:From:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=gpcFzUqmDG0qgGz1/4SXc+hBJ8L5YMfkwvVBwiJeRoFJtMtTCQwnBSALTOvrbipDs
	 1NOCpd3m3ihDE/mpVfidAaeUbc3smViN7e2q1Ds/PARxf6LM+MRRJZghn8dZTp+73s
	 NoxCFq0yYgOSCU+FPYzGr8HnsKkoGjQw/ABirNjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A5BF804FE;
	Tue, 12 Oct 2021 14:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEC3CF80269; Mon, 11 Oct 2021 10:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MISSING_HEADERS, MISSING_SUBJECT,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AD69F80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 10:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD69F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Ffu19PVW"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; s=smtp; t=1633940980; h=From: Date: Message-Id:
 Content-Transfer-Encoding: Content-Type: Sender;
 bh=R6W5PR9vmXmfHSKEzg5/XaU89FBO8lzuuds2Qps9PhA=;
 b=Ffu19PVWcGDO7lbiz0ZdDmNg7WAHDsrpcUKXwg7Sy6HlvljimODMwCZejsELdvLG3NbSgph8
 +7EzddbX8HdmbKSziFU4EUOroqd2OhqTxovznpPV0YDmX3A4CAOQ1fDrLNgawM+j3GKJ7gL4
 FZe+LARtCpy/lNj1NGIQEe46D+c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6163f5e6f3e5b80f1f5e4cb6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:29:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E1144C4361C; Mon, 11 Oct 2021 08:29:25 +0000 (UTC)
Received: from [192.168.1.100] (unknown [157.48.161.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F76FC4338F;
 Mon, 11 Oct 2021 08:29:16 +0000 (UTC)
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <20211011082925.E1144C4361C@smtp.codeaurora.org>
Date: Mon, 11 Oct 2021 08:29:25 +0000 (UTC)
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

The requirement for updating previous defaults in cache is not solving 
here.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

