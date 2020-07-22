Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6A6229588
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72F8B1616;
	Wed, 22 Jul 2020 11:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72F8B1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595411806;
	bh=bts/svk+tjNZFRH+l8RAchMxCG2OEN5ZdKe6klQRvwI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlpL4wKfz3P+MnNP6AfpP2Wl/SEaa2USDF3u5c0SJ0Toy8vVzdw7nA76ttcdTDuQK
	 8QqlqE3JSUiT2cfS2R/G3MWMDrlbs7A3Ac6UCBifOpkEE2oUekFa20Fz8UzWs5x9Vz
	 WNoh4tS9VgyC+ucT2P41M980DzkSO73hliTuWiGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88DA7F80150;
	Wed, 22 Jul 2020 11:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3742F8014C; Wed, 22 Jul 2020 11:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9FC0F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 11:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9FC0F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="km5/D4G2"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4C2920714;
 Wed, 22 Jul 2020 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595411689;
 bh=bts/svk+tjNZFRH+l8RAchMxCG2OEN5ZdKe6klQRvwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=km5/D4G2xonZmIK1g1Wjs9as4EEswLMvzsd8OAkHJgNcthwyhUmWEa90lOXVkNRWD
 1bvJ+pcEG/8+UF7U+wgSd26rNJlZcFs4aQiB5ktJujflu6EwL/TwUwf0IQnSWLMAgE
 paO9x1KHEzQlbDsMjHyeXLWtonHulI58mHNMFrao=
Date: Wed, 22 Jul 2020 11:54:55 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b2t5rWp?= <penghao@uniontech.com>
Subject: Re: 14216-add-prevent-wakeup-from-s3-by-lenovo-Thinkcentre-TI
Message-ID: <20200722095455.GA2816990@kroah.com>
References: <1059302318.389895.1595410349231.JavaMail.xmail@bj-wm-cp-8>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1059302318.389895.1595410349231.JavaMail.xmail@bj-wm-cp-8>
Cc: alsa-devel <alsa-devel@alsa-project.org>, tiwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 =?utf-8?B?6YOR5YW05pe6?= <zhengxingwang@uniontech.com>,
 =?utf-8?B?6YKi5YGl?= <xingjian@uniontech.com>,
 =?utf-8?B?6JSh5YWG6bmP?= <caizhaopeng@uniontech.com>
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

> 此电子邮件消息仅供预期收件人使用，其中可能包含保密或特权使用信息。如果您不是预
> 期收件人，请勿使用、传播、分发或复制此电子邮件或信赖此邮件采取任何行动。如果您
> 误收了此邮件，请立即回复邮件通知统信软件技术有限公司发件人，并删除误收电子邮件
> 及其相关附件。感谢配合！
> 
> This email message is intended only for the use of the individual or entity who
> /which is the intended recipient and may contain information that is privileged
> or confidential. If you are not the intended recipient, you are hereby notified
> that any use, dissemination, distribution or copying of, or taking any action
> in reliance on, this e-mail is strictly prohibited. If you have received this
> email in error, please notify UnionTech Software Technology  immediately by
> replying to this e-mail and immediately delete and discard all copies of the
> e-mail and the attachment thereto (if any). Thank you.

This is not compatible with kernel development, sorry, now deleted.

greg k-h
