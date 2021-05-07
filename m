Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72D3769DB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 20:16:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7820F41;
	Fri,  7 May 2021 20:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7820F41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620411378;
	bh=pQAqIvD0faFDYwmQLvXqV2J14EirQPcIlt80Ua7bcxw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Agf/VkdYy+NN3n1ZX252QrC8A3Ga6jHkKJZvxB/RWz5+M8v9FEk25cfsxm97q4EbU
	 TdTSvXQ6ol20eAsvVduxn9E04qPtD/M6gr+2tk56vtAHG7S9tPBt/hK9CzgipQxKY7
	 Rh+/E0bteqhELAAU6w86slz5iCsR0qHykZJv2W/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2446F80105;
	Fri,  7 May 2021 20:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7A41F8025F; Fri,  7 May 2021 20:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3097F80105
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 20:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3097F80105
IronPort-SDR: fYiDYMuEmwPATCEjpJrR3D3AhIUwPiP1loUNbwt/q2AKoC1rdlX0MxWZOvRqDsvURz+cwK7GEv
 HKwdrCOeEXxA==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="186237575"
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; 
 d="gz'50?scan'50,208,50";a="186237575"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 11:14:28 -0700
IronPort-SDR: G9oNfbv1+JnA4q1SzKnCYJhPtChOAjEk6505oTcQX/VyQaKH1wH3JzYhYQyXGyCWRGLu8QxMMY
 gq5WH8Tu6KpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,281,1613462400"; 
 d="gz'50?scan'50,208,50";a="622967131"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 07 May 2021 11:14:24 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lf4zX-000BLK-Mw; Fri, 07 May 2021 18:14:23 +0000
Date: Sat, 8 May 2021 02:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: cs42l42: make HSBIAS_SENSE_EN optional
Message-ID: <202105080224.hGTjX5Be-lkp@intel.com>
References: <20210507141748.742037-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20210507141748.742037-1-tanureal@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
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


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lucas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on asoc/for-next]
[also build test ERROR on next-20210507]
[cannot apply to v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lucas-Tanure/ASoC-cs42l42-make-HSBIAS_SENSE_EN-optional/20210507-221954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arc-randconfig-s031-20210506 (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/17dc415a57a00d44b8be8db4791a2843daee7db1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lucas-Tanure/ASoC-cs42l42-make-HSBIAS_SENSE_EN-optional/20210507-221954
        git checkout 17dc415a57a00d44b8be8db4791a2843daee7db1
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=arc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs42l42.c: In function 'cs42l42_handle_device_data':
>> sound/soc/codecs/cs42l42.c:1812:33: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
    1812 |  ret = device_property_read_u32(dev, "cirrus,hs-bias-sense-en", &val);
         |                                 ^~~
         |                                 cdev
   sound/soc/codecs/cs42l42.c:1812:33: note: each undeclared identifier is reported only once for each function it appears in


vim +1812 sound/soc/codecs/cs42l42.c

  1632	
  1633	static int cs42l42_handle_device_data(struct i2c_client *i2c_client,
  1634						struct cs42l42_private *cs42l42)
  1635	{
  1636		struct device_node *np = i2c_client->dev.of_node;
  1637		unsigned int val;
  1638		unsigned int thresholds[CS42L42_NUM_BIASES];
  1639		int ret;
  1640		int i;
  1641	
  1642		ret = of_property_read_u32(np, "cirrus,ts-inv", &val);
  1643	
  1644		if (!ret) {
  1645			switch (val) {
  1646			case CS42L42_TS_INV_EN:
  1647			case CS42L42_TS_INV_DIS:
  1648				cs42l42->ts_inv = val;
  1649				break;
  1650			default:
  1651				dev_err(&i2c_client->dev,
  1652					"Wrong cirrus,ts-inv DT value %d\n",
  1653					val);
  1654				cs42l42->ts_inv = CS42L42_TS_INV_DIS;
  1655			}
  1656		} else {
  1657			cs42l42->ts_inv = CS42L42_TS_INV_DIS;
  1658		}
  1659	
  1660		regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
  1661				CS42L42_TS_INV_MASK,
  1662				(cs42l42->ts_inv << CS42L42_TS_INV_SHIFT));
  1663	
  1664		ret = of_property_read_u32(np, "cirrus,ts-dbnc-rise", &val);
  1665	
  1666		if (!ret) {
  1667			switch (val) {
  1668			case CS42L42_TS_DBNCE_0:
  1669			case CS42L42_TS_DBNCE_125:
  1670			case CS42L42_TS_DBNCE_250:
  1671			case CS42L42_TS_DBNCE_500:
  1672			case CS42L42_TS_DBNCE_750:
  1673			case CS42L42_TS_DBNCE_1000:
  1674			case CS42L42_TS_DBNCE_1250:
  1675			case CS42L42_TS_DBNCE_1500:
  1676				cs42l42->ts_dbnc_rise = val;
  1677				break;
  1678			default:
  1679				dev_err(&i2c_client->dev,
  1680					"Wrong cirrus,ts-dbnc-rise DT value %d\n",
  1681					val);
  1682				cs42l42->ts_dbnc_rise = CS42L42_TS_DBNCE_1000;
  1683			}
  1684		} else {
  1685			cs42l42->ts_dbnc_rise = CS42L42_TS_DBNCE_1000;
  1686		}
  1687	
  1688		regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
  1689				CS42L42_TS_RISE_DBNCE_TIME_MASK,
  1690				(cs42l42->ts_dbnc_rise <<
  1691				CS42L42_TS_RISE_DBNCE_TIME_SHIFT));
  1692	
  1693		ret = of_property_read_u32(np, "cirrus,ts-dbnc-fall", &val);
  1694	
  1695		if (!ret) {
  1696			switch (val) {
  1697			case CS42L42_TS_DBNCE_0:
  1698			case CS42L42_TS_DBNCE_125:
  1699			case CS42L42_TS_DBNCE_250:
  1700			case CS42L42_TS_DBNCE_500:
  1701			case CS42L42_TS_DBNCE_750:
  1702			case CS42L42_TS_DBNCE_1000:
  1703			case CS42L42_TS_DBNCE_1250:
  1704			case CS42L42_TS_DBNCE_1500:
  1705				cs42l42->ts_dbnc_fall = val;
  1706				break;
  1707			default:
  1708				dev_err(&i2c_client->dev,
  1709					"Wrong cirrus,ts-dbnc-fall DT value %d\n",
  1710					val);
  1711				cs42l42->ts_dbnc_fall = CS42L42_TS_DBNCE_0;
  1712			}
  1713		} else {
  1714			cs42l42->ts_dbnc_fall = CS42L42_TS_DBNCE_0;
  1715		}
  1716	
  1717		regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
  1718				CS42L42_TS_FALL_DBNCE_TIME_MASK,
  1719				(cs42l42->ts_dbnc_fall <<
  1720				CS42L42_TS_FALL_DBNCE_TIME_SHIFT));
  1721	
  1722		ret = of_property_read_u32(np, "cirrus,btn-det-init-dbnce", &val);
  1723	
  1724		if (!ret) {
  1725			if (val <= CS42L42_BTN_DET_INIT_DBNCE_MAX)
  1726				cs42l42->btn_det_init_dbnce = val;
  1727			else {
  1728				dev_err(&i2c_client->dev,
  1729					"Wrong cirrus,btn-det-init-dbnce DT value %d\n",
  1730					val);
  1731				cs42l42->btn_det_init_dbnce =
  1732					CS42L42_BTN_DET_INIT_DBNCE_DEFAULT;
  1733			}
  1734		} else {
  1735			cs42l42->btn_det_init_dbnce =
  1736				CS42L42_BTN_DET_INIT_DBNCE_DEFAULT;
  1737		}
  1738	
  1739		ret = of_property_read_u32(np, "cirrus,btn-det-event-dbnce", &val);
  1740	
  1741		if (!ret) {
  1742			if (val <= CS42L42_BTN_DET_EVENT_DBNCE_MAX)
  1743				cs42l42->btn_det_event_dbnce = val;
  1744			else {
  1745				dev_err(&i2c_client->dev,
  1746				"Wrong cirrus,btn-det-event-dbnce DT value %d\n", val);
  1747				cs42l42->btn_det_event_dbnce =
  1748					CS42L42_BTN_DET_EVENT_DBNCE_DEFAULT;
  1749			}
  1750		} else {
  1751			cs42l42->btn_det_event_dbnce =
  1752				CS42L42_BTN_DET_EVENT_DBNCE_DEFAULT;
  1753		}
  1754	
  1755		ret = of_property_read_u32_array(np, "cirrus,bias-lvls",
  1756					   (u32 *)thresholds, CS42L42_NUM_BIASES);
  1757	
  1758		if (!ret) {
  1759			for (i = 0; i < CS42L42_NUM_BIASES; i++) {
  1760				if (thresholds[i] <= CS42L42_HS_DET_LEVEL_MAX)
  1761					cs42l42->bias_thresholds[i] = thresholds[i];
  1762				else {
  1763					dev_err(&i2c_client->dev,
  1764					"Wrong cirrus,bias-lvls[%d] DT value %d\n", i,
  1765						thresholds[i]);
  1766					cs42l42->bias_thresholds[i] =
  1767						threshold_defaults[i];
  1768				}
  1769			}
  1770		} else {
  1771			for (i = 0; i < CS42L42_NUM_BIASES; i++)
  1772				cs42l42->bias_thresholds[i] = threshold_defaults[i];
  1773		}
  1774	
  1775		ret = of_property_read_u32(np, "cirrus,hs-bias-ramp-rate", &val);
  1776	
  1777		if (!ret) {
  1778			switch (val) {
  1779			case CS42L42_HSBIAS_RAMP_FAST_RISE_SLOW_FALL:
  1780				cs42l42->hs_bias_ramp_rate = val;
  1781				cs42l42->hs_bias_ramp_time = CS42L42_HSBIAS_RAMP_TIME0;
  1782				break;
  1783			case CS42L42_HSBIAS_RAMP_FAST:
  1784				cs42l42->hs_bias_ramp_rate = val;
  1785				cs42l42->hs_bias_ramp_time = CS42L42_HSBIAS_RAMP_TIME1;
  1786				break;
  1787			case CS42L42_HSBIAS_RAMP_SLOW:
  1788				cs42l42->hs_bias_ramp_rate = val;
  1789				cs42l42->hs_bias_ramp_time = CS42L42_HSBIAS_RAMP_TIME2;
  1790				break;
  1791			case CS42L42_HSBIAS_RAMP_SLOWEST:
  1792				cs42l42->hs_bias_ramp_rate = val;
  1793				cs42l42->hs_bias_ramp_time = CS42L42_HSBIAS_RAMP_TIME3;
  1794				break;
  1795			default:
  1796				dev_err(&i2c_client->dev,
  1797					"Wrong cirrus,hs-bias-ramp-rate DT value %d\n",
  1798					val);
  1799				cs42l42->hs_bias_ramp_rate = CS42L42_HSBIAS_RAMP_SLOW;
  1800				cs42l42->hs_bias_ramp_time = CS42L42_HSBIAS_RAMP_TIME2;
  1801			}
  1802		} else {
  1803			cs42l42->hs_bias_ramp_rate = CS42L42_HSBIAS_RAMP_SLOW;
  1804			cs42l42->hs_bias_ramp_time = CS42L42_HSBIAS_RAMP_TIME2;
  1805		}
  1806	
  1807		regmap_update_bits(cs42l42->regmap, CS42L42_HS_BIAS_CTL,
  1808				CS42L42_HSBIAS_RAMP_MASK,
  1809				(cs42l42->hs_bias_ramp_rate <<
  1810				CS42L42_HSBIAS_RAMP_SHIFT));
  1811	
> 1812		ret = device_property_read_u32(dev, "cirrus,hs-bias-sense-en", &val);
  1813		if (!ret) {
  1814			switch (val) {
  1815			case CS42L42_HSBIAS_SENSE_OFF:
  1816			case CS42L42_HSBIAS_SENSE_ON:
  1817				cs42l42->hs_bias_sense_en = val;
  1818				break;
  1819			default:
  1820				dev_err(dev,
  1821					"Wrong cirrus,hs-bias-sense-en DT value %d\n",
  1822					val);
  1823				cs42l42->hs_bias_sense_en = CS42L42_HSBIAS_SENSE_ON;
  1824				break;
  1825			}
  1826		} else {
  1827			cs42l42->hs_bias_sense_en = CS42L42_HSBIAS_SENSE_ON;
  1828		}
  1829	
  1830		return 0;
  1831	}
  1832	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--1yeeQ81UyVL57Vl7
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
2xqRH0PHZFHfvvwvB9T2WoZrAQA=

--1yeeQ81UyVL57Vl7--
