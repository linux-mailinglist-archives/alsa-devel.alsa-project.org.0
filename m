Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD167C526
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 08:49:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB06E82C;
	Thu, 26 Jan 2023 08:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB06E82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674719389;
	bh=76XT9aCTD8B8LT/q4agWyU0rMRgv/FmnnUUpPtrX7Go=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ThGgSQDS+bcq1elJWeUkvNy69VT/mpi76wavA9aC5cOsOjLM+uIaIAknqo81QqFZD
	 dmou6nR3UM9TpIqLhOHNcKnmZAAgHJpxafy66iRSXKHemdKTCuYZsMKdkBmbCKF2iq
	 aCiLGfeuY5GAhSBZf8Dq6tRaK0syl6/kcoUJJM9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 162BDF802DF;
	Thu, 26 Jan 2023 08:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EC48F8027D; Thu, 26 Jan 2023 08:48:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7B32F800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 08:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B32F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=sw/vGS+2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3486F6175A;
 Thu, 26 Jan 2023 07:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FAEC433EF;
 Thu, 26 Jan 2023 07:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674719312;
 bh=76XT9aCTD8B8LT/q4agWyU0rMRgv/FmnnUUpPtrX7Go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sw/vGS+2pAXtLvctCylbRvR+u/imgaZoMtOLeimjFEQNJNjGptMd1vAbA/RlBD7Ki
 mG0YkGFe3I91Z+mzXfv3Qv0/i2eP19WhP96lYluQ2vPBclUfvgM0UTbmKbwtuiht5+
 ebwhII+jfGloNGj5Q0x3TfIMFXgDVOqMUbBt7Z8I=
Date: Thu, 26 Jan 2023 08:48:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH v2 02/22] xhci: remove xhci_test_trb_in_td_math early
 development check
Message-ID: <Y9IwTTb7dfkI7C6b@kroah.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-3-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126031424.14582-3-quic_wcheng@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>,
 bgoswami@quicinc.com, mathias.nyman@intel.com, Thinh.Nguyen@synopsys.com,
 andersson@kernel.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 07:14:04PM -0800, Wesley Cheng wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Time to remove this test trb in td math check that was added
> in early stage of xhci driver deveopment.
> 
> It verified that the size, alignment and boundaries of the event and
> command rings the driver itself allocated are correct.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Note, if you pass on a patch from someone else, you HAVE to also
sign-off on it as well.  For that reason alone this series would have to
be rejected :(

thanks,

greg k-h
