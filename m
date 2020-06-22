Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2E12036E2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 14:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21FA116B4;
	Mon, 22 Jun 2020 14:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21FA116B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592829252;
	bh=vUsQ4/bIHVn4jBo65OALfNI338jW6zMlkCy7dd1UtUo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z6nl1Baaf/UMtKhwiAiYUqE/OMUotPS9G+bXoOTFrbbvD48WB5n1mDMaoQHDL16h5
	 tGVEcl6rWKBx1xBoN76UNr7eFivhDvkZA6mhxqlZdWm6yN/Qg//lFpyxDF/5Ig5sAz
	 0jefeMCy+AUb9izJnNMX5rMADII6FbUAJkmZRpnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 390B5F80162;
	Mon, 22 Jun 2020 14:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D9E6F80157; Mon, 22 Jun 2020 14:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84BB8F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 14:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84BB8F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kQhewzvs"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CA1B206BE;
 Mon, 22 Jun 2020 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592829079;
 bh=vUsQ4/bIHVn4jBo65OALfNI338jW6zMlkCy7dd1UtUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kQhewzvsjTq3cvPrzmIBgb5SttjfYpYAIvQ5Sk32Q6C8nxucZEc7myegU6NDew1Ql
 Om4NchBLWbGKl0T0gUerAdMSFOJno0IDf+H3x+a1YRaJx5M8asWcogxHQ6vTkHl6nl
 7gS0eiC95+Xni+DDX+Xb7uWSTTR/yN282ozy9BK4=
Date: Mon, 22 Jun 2020 08:31:18 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200622123118.GF1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
 <20200622112321.GB4560@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200622112321.GB4560@sirena.org.uk>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Mon, Jun 22, 2020 at 12:23:21PM +0100, Mark Brown wrote:
>On Sun, Jun 21, 2020 at 07:33:52PM -0400, Sasha Levin wrote:
>> On Thu, Jun 18, 2020 at 03:39:30PM +0100, Mark Brown wrote:
>> > On Thu, Jun 18, 2020 at 10:30:46AM -0400, Sasha Levin wrote:
>> > > On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:
>
>> > > > This is a new feature not a bugfix.
>
>> > > I saw this patch more as a hardware quirk.
>
>> > Pretty much any DT property is a hardware quirk :(
>
>> Which is why we're taking most of them :)
>
>That's concerning - please don't do this.  It's not what stable is
>expected to be and there's no guarantee that you're getting all the
>changes required to actually make things work.

How come? This is one of the things stable rules explicitly call for:
"New device IDs and quirks are also accepted".

If we're missing anything, the solution is to make sure we stop missing
it rather than not take anything to begin with :)

-- 
Thanks,
Sasha
