Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB61B596
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B381716DC;
	Mon, 13 May 2019 14:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B381716DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557749654;
	bh=ird2hvqe9Lt1Z5niT3wXdWiKPGjTEhp2r3H1JPcYvEw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6vMqvBzgAFbn8YMgsTEGem8xvFKwghQlpzvZUQRMX9B8qJKPSik3shWfGuHDYy4M
	 VJOuLi3bdCzS9QYs4rgJWvcPYxUu5Hx6P9tJ1QYelrqQRkjpJmOU1bIVfrv4IgciEl
	 dsq3QmFbSke2FZBLrbyDYer8wsj+N/IzbumNVdns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C63AF89732;
	Mon, 13 May 2019 14:11:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79447F896FD; Fri, 10 May 2019 13:03:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27F1DF80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 13:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F1DF80730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="D51Bv0We"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4AAx1NB144244;
 Fri, 10 May 2019 11:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=CfM0QyoiD2lceMf/MJC3mMjfCfXAd2/bfEOAWv0cJ2Q=;
 b=D51Bv0We8QTowc99zvTCIJuTCbSCXoc9B56Z8ExvQIyI9tdem+W93bgyBgMXVwunZ8pv
 4kxXOENcN94heTpPe2HdMrlJB2T3qCmEYwsZdQFLCZzVl7iwnIcB0+tOsj8a33pcDZ2b
 apaVZ8tiLXNzMfnoXrAtpjl+jnRLf4c9KQWuZg+PnEEgt/vdDBqRhVHpu/5TuzfI6BfK
 fi+8tUJU/aJFGtgdSqiKUrW3X2rQyYClgjiNr0e4R6bCAQx6tWNkz5Uq/nnWCSvgOzQY
 +Vw2Uu/Wf73/Oj/IUlLw1hBGhDnT3dAWjKij3V31FPg//vP2lgc79WQPCO9s4WRRuFde AQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2s94bggas0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 11:03:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4AB16kE183844;
 Fri, 10 May 2019 11:01:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2scpy66rqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 11:01:43 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4AB1WHN021937;
 Fri, 10 May 2019 11:01:32 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 May 2019 04:01:31 -0700
Date: Fri, 10 May 2019 14:01:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Message-ID: <20190510110116.GB18105@kadam>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-11-alexandru.ardelean@analog.com>
 <20190508122010.GC21059@kadam>
 <2ec6812d6bf2f33860c7c816c641167a31eb2ed6.camel@analog.com>
 <31be52eb1a1abbc99a24729f5c65619235cb201f.camel@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31be52eb1a1abbc99a24729f5c65619235cb201f.camel@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=764
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905100078
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9252
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=796 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905100078
X-Mailman-Approved-At: Mon, 13 May 2019 14:10:24 +0200
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH 09/16] mmc: sdhci-xenon: use new
 match_string() helper/macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, May 10, 2019 at 09:13:26AM +0000, Ardelean, Alexandru wrote:
> On Wed, 2019-05-08 at 16:26 +0300, Alexandru Ardelean wrote:
> > On Wed, 2019-05-08 at 15:20 +0300, Dan Carpenter wrote:
> > > 
> > > 
> > > On Wed, May 08, 2019 at 02:28:35PM +0300, Alexandru Ardelean wrote:
> > > > -static const char * const phy_types[] = {
> > > > -     "emmc 5.0 phy",
> > > > -     "emmc 5.1 phy"
> > > > -};
> > > > -
> > > >  enum xenon_phy_type_enum {
> > > >       EMMC_5_0_PHY,
> > > >       EMMC_5_1_PHY,
> > > >       NR_PHY_TYPES
> > > 
> > > There is no need for NR_PHY_TYPES now so you could remove that as well.
> > > 
> > 
> > I thought the same.
> > The only reason to keep NR_PHY_TYPES, is for potential future patches,
> > where it would be just 1 addition
> > 
> >  enum xenon_phy_type_enum {
> >       EMMC_5_0_PHY,
> >       EMMC_5_1_PHY,
> > +      EMMC_5_2_PHY,
> >       NR_PHY_TYPES
> >   }
> > 
> > Depending on style/preference of how to do enums (allow comma on last
> > enum
> > or not allow comma on last enum value), adding new enum values woudl be 2
> > additions + 1 deletion lines.
> > 
> >  enum xenon_phy_type_enum {
> >       EMMC_5_0_PHY,
> > -      EMMC_5_1_PHY
> > +      EMM
> > C_5_1_PHY,
> > +      EMMC_5_2_PHY
> >  }
> > 
> > Either way (leave NR_PHY_TYPES or remove NR_PHY_TYPES) is fine from my
> > side.
> > 
> 
> Preference on this ?
> If no objection [nobody insists] I would keep.
> 
> I don't feel strongly about it [dropping NR_PHY_TYPES or not].

If you end up resending the series could you remove it, but if not then
it's not worth it.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
